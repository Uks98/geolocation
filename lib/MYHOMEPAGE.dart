
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Position? currentPosition;

    void geolocation() async {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    }


    return Scaffold(
      appBar: AppBar(title: const Text("내 위치 찾기"),),
      body: Container(
        child: Column(children: [
          Text(""),
          SizedBox(
            height: 300,
          ),

        ],),
      ),
    );
  }

  void _determinePosition() async {
    // Test if location services are enabled.
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('Location services are disabled.');
      return;
    }
  }
}