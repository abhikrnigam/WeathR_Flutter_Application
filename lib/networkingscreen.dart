import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{
  static const api="5c4b43e71a894a82f44b22d469d79b80";


  dynamic responseCity;
  dynamic response;
  dynamic responseCityUV;
  dynamic responseuv;
  double latitude;
  double longitude;

  Future getResponse(double latitude,double longitude) async{


  response=await http.get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$api&units=metric');
  return response;

}
  Future getUVIndex(double latitude,double longitude) async{

responseuv=await http.get('https://samples.openweathermap.org/data/2.5/uvi?lat=$latitude&lon=-$longitude&appid=$api');
return responseuv;
}

Future getCityUVResponse(cityname) async{
    responseCity =await http.get('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$api&units=metric');
    latitude=jsonDecode(responseCity.body)['coord']['lat'];
    longitude=jsonDecode(responseCity.body)['coord']['lon'];
   responseCityUV=await http.get('https://samples.openweathermap.org/data/2.5/uvi?lat=$latitude&lon=-$longitude&appid=$api');
   return responseCityUV;
}
  Future getCityResponse(cityname) async {
    responseCity = await http.get('https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$api&units=metric');
    return responseCity;
  }
}