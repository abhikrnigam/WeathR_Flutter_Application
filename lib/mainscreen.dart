import 'dart:convert';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:weathr/welcomescreen.dart';
import 'conditions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weathr/weatherconditions.dart';
import 'package:google_fonts/google_fonts.dart';



class MainScreen extends StatefulWidget {

  MainScreen({@required this.response,@required this.responseuv});
  dynamic response;
  dynamic responseuv;

  @override
  _MainScreenState createState() => _MainScreenState();


}


class _MainScreenState extends State<MainScreen> {
  @override

  var temperature;
  var weather;
  int weatherID;
  var cityname;
  double UVIndex;
  Color UVColor;
  int condition;
  String majorScreen;
 Icon weatherIcon;
  WeatherConditions weatherConditions=new WeatherConditions();
  DecorationImage MajorScreen;
  DateTime a=DateTime.now();
  Conditions cond=new Conditions();
  dynamic response;
  dynamic responseuv;

  void initState() {
    super.initState();
     response=widget.response;
     responseuv=widget.responseuv;
    updateUI(response,responseuv);
  }

  void updateUI(response,responseuv){
    setState(() {
      temperature=jsonDecode(response.body)['main']['temp'];
      weather=jsonDecode(response.body)['weather'][0]['main'];
      weatherID=jsonDecode(response.body)['weather'][0]['id'];
      cityname=jsonDecode(response.body)['name'];
      condition=jsonDecode(response.body)['weather'][0]['id'];
      weatherIcon=weatherConditions.getWeatherIcon(condition);
      MajorScreen=weatherConditions.getWeatherImage(condition);
      if(responseuv==null){
        UVIndex=null;
      }
      else
        {
          UVIndex=jsonDecode(responseuv.body)['value'];
        }

      safeUV(UVIndex);
    });
  }
  void safeUV(UVIndex){
    if(UVIndex<=5){
      UVColor=Colors.green;
    }
    else if(UVIndex>5 && UVIndex<=10)
      {
        UVColor=Colors.red;
      }
    else UVColor=Colors.deepPurpleAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: <Widget>[
                FractionallySizedBox(
                  heightFactor: 1.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0)),
                    child:  Container(
                      decoration: BoxDecoration(
                        image: MajorScreen,
                      ),
                    ),
                  ),

                ),
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));//welcomescreen
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 30.0,
                                color: Colors.white,
                              ),
                          ),
                        ),
                      ),
                      Spacer(flex: 1,),
                      Row(
                        children: <Widget>[
                          Text(
                            " UV Level: ",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '$UVIndex',
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: UVColor,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0,),
                      Text(
                        '${temperature.round()}° C',
                        style: GoogleFonts.poppins(
                          shadows:  [
                            Shadow(
                              blurRadius: 30.0,
                              color: Colors.black,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                          fontSize: 100.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(flex: 1,),
                      Divider(
                        color: Colors.white,
                        indent: 30.0,
                        endIndent: 30.0,
                        thickness: 1.0,
                      ),
                      Spacer(flex: 1,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex:7,
                            child: Text(
                              ' $weather',
                              style: GoogleFonts.fredokaOne(
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: weatherIcon,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ' $cityname ',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(flex: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


}
}


