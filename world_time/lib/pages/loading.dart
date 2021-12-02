import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingscreen extends StatefulWidget {
  const loadingscreen({Key? key}) : super(key: key);

  @override
  _loadingscreenState createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    worldtime();
  }

  void worldtime() async {
    worldTime w = new worldTime(
        location: "Kolkata", flag: "India.png", url: "Asia/dubai");
    await w.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': w.flag,
      'location': w.location,
      'time': w.time,
      'isDay': w.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
