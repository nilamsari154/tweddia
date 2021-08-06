import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/page/about.dart';
import 'package:tweddia/page/change_password.dart';
import 'package:tweddia/page/help_and_suport.dart';
import 'package:tweddia/page/login_screen.dart';
import 'package:tweddia/page/profile/detail_page/body.dart';
import 'package:tweddia/page/profile/detail_page/detail_profile.dart';
import 'package:tweddia/page/profile/profile/constans.dart';
import 'package:tweddia/service/userdataservice.dart';

import 'list_item.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
  // This widget is the root of your application.
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;

  Usermodel usermodel = new Usermodel();
  String key_id = "0";
  bool isLoading = true;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": key_id,
    };
    var requestBody = jsonEncode(map);
    UserdataServices.getdatauser(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        usermodel = Usermodel.fromJson(result.content);
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }

  Future<void> _signOut() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Log Out"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Are you sure log out"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('image/ic_orang.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            usermodel.name ?? "",
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user,
                        text: 'Acount',
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return DetailProfilePage();
                            }),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.lock,
                        text: 'Change password',
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return Changepasswordpage();
                            }),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return HelpPage();
                            }),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.info_circle,
                        text: 'About',
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) {
                              return AboutPage();
                            }),
                          );
                        },
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        press: () {
                          _signOut();
                        },
                        hasNavigation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
