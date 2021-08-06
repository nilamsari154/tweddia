import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/models/verificationmodel.dart';
import 'package:tweddia/page/reset_succes.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/userdataservice.dart';

class Changepasswordpage extends StatefulWidget {
  static String tag = 'ForgotPaswword-page';
  final VerificationCodeModel verificationEmail;
  const Changepasswordpage({Key key, this.verificationEmail}) : super(key: key);
  @override
  ChangepasswordpageState createState() => new ChangepasswordpageState();
}

class ChangepasswordpageState extends State<Changepasswordpage> {
  var _passwordController = new TextEditingController();
  var _repasswordController = new TextEditingController();
  bool isLoading = false;

  ApiResponse apiResponse;
  int selectedIndex = 0;

  Usermodel usermodel = new Usermodel();
  String key_id = "0";

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

  void changepassword() {
    String id;
    id = usermodel.id;
    Map map = {
      "id": id,
      "password": _passwordController.text,
    };
    var requestBody = jsonEncode(map);
    UserdataServices.updatedatauser(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetsuccesScreen()),
        );
      } else {
        _handledVerifError(
            "Failed to Send Verification Code, message: " + result.message);
      }
    }).catchError((error) {
      _handledVerifError(
          "Failed to Send Verification Code, message: " + error.toString());
    });
    print(requestBody);
  }

  void _handledVerifError(String errorMessage) {
    print(errorMessage);
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final password = TextFormField(
      keyboardType: TextInputType.text,
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Type New Password',
        prefixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final repassword = TextFormField(
      keyboardType: TextInputType.text,
      // controller: _repasswordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Retype New Password',
        prefixIcon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final saveButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          changepassword();
        },
        padding: EdgeInsets.all(12),
        color: kPrimaryColor,
        child:
            Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    return isLoading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Change Password",
              ),
              backgroundColor: Colors.white,
            ),
            body: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 150),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70.0,
                    child: Image.asset(
                      'image/icon-key2.png',
                      width: 320,
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 270, left: 70, right: 70),
                    child: Text(
                      "Your New Password Must Be Different from Previously Used Password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 300),
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      password,
                      SizedBox(height: 15.0),
                      repassword,
                      SizedBox(height: 15.0),
                      saveButton,
                    ],
                  ),
                ),
              ],
            ));
  }
}
