import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whether/home.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {





  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => new Home()),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 180.0,
          width: 180.0,
        ),
      ),
    );
  }
}
