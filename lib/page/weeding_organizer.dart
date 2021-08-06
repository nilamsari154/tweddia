import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/page/home/home_screen.dart';
import 'package:tweddia/page/selectvendor/selectvendor_screen.dart';

import '../size_config.dart';

class WoPage extends StatelessWidget {
  String value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Container(
                width: 250,
                margin: EdgeInsets.only(
                    // left: getProportionateScreenWidth(55),
                    right: getProportionateScreenWidth(150),
                    bottom: getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(20),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ), //Offset
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20.0)),
                  image: const DecorationImage(
                    image: AssetImage('image/wo.JPG'),
                  ),
                ),
              ),
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/dekorasi.JPG'),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "dekorasi");
                }));
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/tata.JPG'),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.asset('image/tatabusana.png', width: 50),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "tata busana");
                }));
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/catering.JPG'),
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Image.asset('image/catering.png', width: 50),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "catering");
                }));
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/hiburan.JPG'),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Image.asset('image/hiburan.png', width: 50),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "hiburan");
                }));
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/dokumentasi.JPG'),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Image.asset('image/dokumentasi.png', width: 50),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "dokumentasi");
                }));
              },
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Container(
                  width: 300,
                  margin: EdgeInsets.only(
                      left: getProportionateScreenWidth(55),
                      right: getProportionateScreenWidth(55),
                      bottom: getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ), //Offset
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(
                      color: kPrimaryColor,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/aksesoris.JPG'),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Image.asset('image/aksesoris.png', width: 40),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new SelectvendorPage(value = "aksesoris");
                }));
              },
            ),
          ]),
        ],
      ),
    );
  }
}
