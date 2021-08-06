import 'dart:convert';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/page/edit_profile/edit_profile.dart';
import 'package:tweddia/page/profile/detail_page/constans.dart';
import 'package:tweddia/page/profile/profile/body.dart';
import 'package:tweddia/service/userdataservice.dart';

import 'list_item.dart';

class DetailProfileScreen extends StatefulWidget {
  @override
  _DetailProfileScreenState createState() => _DetailProfileScreenState();
  // This widget is the root of your application.
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 2),
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
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return ProfilePage();
                    }),
                  );
                },
              ),
              title: Text(
                "Acount",
              ),
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      DetailProfileListItem(
                        icon: Icons.person_outlined,
                        text: usermodel.name ?? "",
                      ),
                      DetailProfileListItem(
                        icon: Icons.email_outlined,
                        text: usermodel.email ?? "",
                      ),
                      DetailProfileListItem(
                        icon: LineAwesomeIcons.lock,
                        text: usermodel.password ?? "",
                      ),
                      DetailProfileListItem(
                        icon: LineAwesomeIcons.phone,
                        text: usermodel.handphone ?? "",
                      ),
                      SizedBox(width: kSpacingUnit.w * 4),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w * 2,
                        ).copyWith(
                          bottom: kSpacingUnit.w * 2,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kSpacingUnit.w,
                        ),
                        // padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) {
                                return EditProfilePage();
                              }),
                            );
                          },
                          padding: EdgeInsets.all(12),
                          color: kPrimaryColor,
                          child: Text('Edit Profile',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
