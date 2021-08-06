import 'package:flutter/material.dart';

import '../constans.dart';
import '../size_config.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * 6,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Container(
                width: 250,
                margin: EdgeInsets.only(
                    left: getProportionateScreenWidth(66),
                    right: getProportionateScreenWidth(60),
                    bottom: getProportionateScreenWidth(20)),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(60),
                  vertical: getProportionateScreenWidth(20),
                ),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('image/about.png'), fit: BoxFit.fill),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: kDefaultPadding * 2,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Container(
                  width: 600,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: kPrimaryColor),
                  )),
            )
          ]),
          Positioned(
            left: 30,
            top: height * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.keyboard_backspace,
                size: 42,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
