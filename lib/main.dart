import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var longitude = "longitude";
  var latitude = "latitude";

  void getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      toastMessage(context,"위치를 허용해주세요");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        toastMessage(context,"현재 위치정보입니다.");
        longitude = currentLoc.longitude.toString();
        latitude = currentLoc.latitude.toString();
      });
    }
  }

  void toastMessage(BuildContext context,String text){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Row(
          children: const [
            Text(
              "현재 위치",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              " 찾기",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "longitude : " + longitude,
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 30,
              ),
            ),
            Text(
              "latitude : " + latitude,
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 30,
              ),
            ),
            MaterialButton(
              onPressed: getlocation,
              color: Colors.indigo[900],
              child: const Text(
                "위치 찾기 버튼",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}