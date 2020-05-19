
import 'package:geolocator/geolocator.dart';

class Location{
  Future getLocation() async{
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return position;
  }
}