import 'package:flutter/material.dart';
import 'dart:async';
import './login_screen.dart';

class ResetsuccesScreen extends StatefulWidget {
  String get tag => null;

  @override
  _ResetsuccesScreenState createState() => _ResetsuccesScreenState();
}

class _ResetsuccesScreenState extends State<ResetsuccesScreen> {
  get child => null;

  @override
  void initState() {
    super.initState();
    startResetsuccesScreen();
  }

  startResetsuccesScreen() async {
    var duration = const Duration(seconds: 1);
    return Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('/login_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Center(
          child: Image.asset('image/pattern-success.png', width: 900),
        ),
        Center(
          child: Image.asset(
            'image/succes.png',
            width: 300,
            height: 160,
          ),
        ),
      ],
    ));
  }
}
