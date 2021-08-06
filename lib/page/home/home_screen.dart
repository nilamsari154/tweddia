import 'package:flutter/material.dart';

import '../../constans.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding * 6,
                      right: kDefaultPadding * 6),
                  child: Row(
                    children: <Widget>[
                      Image.asset('image/logoo2.png', width: 180),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: kDefaultPadding,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding),
                  child: Column(children: <Widget>[
                    Image.asset(
                      'image/iklan1.JPG',
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'image/iklan2.jpg',
                        // height: 100,
                        width: 120,
                      ),
                      Image.asset(
                        'image/iklan3.jpg',
                        // height: 100,
                        width: 120,
                      ),
                      Image.asset(
                        'image/iklan4.jpg',
                        // height: 100,
                        width: 120,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: kDefaultPadding * 2),
                  child: Column(children: <Widget>[
                    Image.asset(
                      'image/iklan5.jpg',
                    ),
                  ]),
                ),
              ]),
        ],
      ),
    );
  }
}
