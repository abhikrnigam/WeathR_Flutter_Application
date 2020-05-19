import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'networkingscreen.dart';
import 'mainscreen.dart';

class LoadingScreenCity extends StatefulWidget {
  String cityName;
  LoadingScreenCity({@required this.cityName});
  @override
  _LoadingScreenCityState createState() => _LoadingScreenCityState();
}

class _LoadingScreenCityState extends State<LoadingScreenCity> {

  Networking networking=new Networking();
  dynamic response;
  dynamic responseuv;
  void getData(cityName) async{
    response = await networking.getCityResponse(cityName);
    responseuv = await networking.getCityUVResponse(cityName);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(response: response, responseuv: responseuv,)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.cityName);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitWave(
        size: 50.0,
        color: Colors.white,
      ),
    );
  }
}
