import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mycanteen/Login.dart';
import 'package:mycanteen/welcome.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartTimer();
  }

  StartTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, LoginRoute);
  }

  LoginRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  @override
  Widget build(BuildContext context) {
    return InitWidgate();
  }

  Widget InitWidgate() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: new Color(0xff1b5e20),
              gradient: LinearGradient(
                colors: [(new Color(0xff1b5e20)), (new Color(0xffeeff41))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("images/LG.png"),
            ),
          ),
        ],
      ),
    );
  }
}
