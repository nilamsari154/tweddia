import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/verificationmodel.dart';
import 'package:tweddia/service/forgotservices.dart';
import './login_screen.dart';
import 'forgot_password_verification.dart';

class ForgotpasswordPage extends StatefulWidget {
  static String tag = 'ForgotPaswword-page';
  @override
  _ForgotpasswordPageState createState() => new _ForgotpasswordPageState();
}

class _ForgotpasswordPageState extends State<ForgotpasswordPage> {
  var _emailController = new TextEditingController();
  VerificationCodeModel _verificationCodeModel = new VerificationCodeModel();
  bool isSendEmailVerification = false;

  void sendemailverification() {
    setState(() {
      isSendEmailVerification = true;
    });
    VerificationCodeModel verificationCodeModel =
        new VerificationCodeModel(email: _emailController.text);

    var requestBody = jsonEncode(verificationCodeModel.toJson());
    UserForgotServices.sendemailverification(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _verificationCodeModel = VerificationCodeModel.fromJson(result.content);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OTPPage(verificationCodeModel: _verificationCodeModel)),
        );
      }
      setState(() {
        isSendEmailVerification = false;
      });
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
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

    final sendButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          sendemailverification();
        },
        padding: EdgeInsets.all(12),
        color: kPrimaryColor,
        child:
            Text('Send', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    final loginLabel = FlatButton(
      child: Text(
        'Log in',
        style: TextStyle(color: kPrimaryColor),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/login_page');
      },
    );

    return isSendEmailVerification
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Forgot Password",
              ),
              backgroundColor: kPrimaryColor,
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
                      'image/icon-key1.png',
                      width: 320,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 250, left: 147),
                    child: Text(
                      "Trouble logging in?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 280, left: 70),
                    child: Text(
                      "Enter your username or email and we’ll send \n     you a link to get back into your account",
                      style: TextStyle(fontSize: 16),
                    )),
                Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 160),
                    children: <Widget>[
                      email,
                      SizedBox(height: 10.0),
                      sendButton,
                      SizedBox(height: 60.0),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 780, left: 160),
                    child: Text(
                      "Back to",
                      style: TextStyle(color: Colors.black54),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 740, left: 50),
                  child: ListView(
                    children: [
                      loginLabel,
                    ],
                  ),
                )
              ],
            ));
  }
}
