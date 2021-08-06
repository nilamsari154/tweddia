import 'package:flutter/material.dart';
import 'dart:async';
import '../size_config.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  String get tag => null;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get child => null;

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/login_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Center(
          child: Image.asset(
            'image/logo.jpeg',
            width: 700,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ));
  }
}
