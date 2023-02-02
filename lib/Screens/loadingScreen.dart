import 'package:climate/Services/Networking.dart';
import 'package:flutter/material.dart';
import 'package:climate/Services/location.dart';
import 'locationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const  apikey = '00c70cac44b33cf66a3a90da7f7b977e';
class loadingScreen extends StatefulWidget {
  const loadingScreen({Key? key}) : super(key: key);

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {

  late double latitu;
  late double longi;

  // late int x;

  void initState()
  {
    getLocation();
  }
  void getLocation() async
  {
    Location location = Location();
    await location.getcurrLocation();
    latitu = location.latitude;
    print(latitu);
    longi = location.longetute;
    print(longi);
    Networking networking = Networking('https://api.openweathermap.org/data/2.5/weather?lat=$latitu&lon=$longi&APPID=$apikey&units=metric');

    var wheatherdata = await networking.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(wheatherdata: wheatherdata,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}