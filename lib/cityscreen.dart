import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weathr/mainscreen.dart';
import 'networkingscreen.dart';
import 'LoadingScreenCity.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  Networking networking=new Networking();
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/MajorScreenTrees.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'welcomescreen');

                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(flex: 4),
                TextField(

                  textAlign: TextAlign.center,
                  onChanged: (value) async{
                      cityName=value;
                  },
                  cursorColor: Colors.black26,
                  cursorWidth: 2.0,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.city,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                RawMaterialButton(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                      'Get Weather',
                    style: GoogleFonts.pacifico(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  onPressed: () async{

                   if(cityName==null){
                     print("NULL VALUES");
                   }
                   else{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadingScreenCity(cityName: cityName,)));
                   }
                  },
                ),
                Spacer(flex: 5,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
