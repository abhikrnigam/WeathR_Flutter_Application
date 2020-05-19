import 'package:flutter/material.dart';
import 'Location.dart';
import 'networkingscreen.dart';
import 'mainscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'cityscreen.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  Location location=new Location();
  Networking networking=new Networking();


  dynamic response;
  dynamic responseuv;
  dynamic position;
  double latitude;
  double longitude;
  String cityname;

  void getWeatherData() async{

    position=await location.getLocation();
    latitude=position.latitude;
    longitude=position.longitude;
    response=await networking.getResponse(latitude, longitude);
    responseuv=await networking.getUVIndex(latitude, longitude);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen(response: response,responseuv: responseuv,)));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: SpinKitWave(
        size: 50.0,
        color: Colors.white,
      ),
    );
  }
}
