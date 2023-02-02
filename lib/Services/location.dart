import 'package:geolocator/geolocator.dart';
class Location{


  late double latitude;
  late double longetute;


  Future<void> getcurrLocation()
  async {

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print(position.runtimeType);
      latitude = position.latitude;
      longetute = position.longitude;
      // x = position;

    }
    catch(e)
    {
      print(e);
    }
  }
}