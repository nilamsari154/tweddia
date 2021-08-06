import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/page/bottomnavigation.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/userloginservices.dart';
import 'package:flutter/material.dart';
import './registration_screen.dart';
import './forgot_password_screen.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiResponse apiResponse;
  Usermodel usermodel = new Usermodel();
  String uid;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error !'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Incorrect email or password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void authentication() {
    Usermodel usermodel = new Usermodel(
        email: _emailController.text, password: _passwordController.text);

    var requestBody = jsonEncode(usermodel.toJson());
    print(requestBody);
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      print(result.content);
      if (result.success == true && result.code == 200) {
        usermodel = Usermodel.fromJson(result.content);
        uid = usermodel.id.toString();
        print(uid);

        _storeUserData();
        _emailController.text = "";
        _passwordController.text = "";
        Navigator.of(context).pushReplacementNamed('/navbar_bottom');
      } else {
        _showMyDialog();
      }
    }).catchError((error) {
      // String err = error.toString();
    });
  }

  void _storeUserData() async {
    final storage = FlutterSecureStorage();
    await storage.write(key: Constanta.keyId, value: uid);
    print(uid);
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: Colors.lime[900],
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF827717), width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );

    final password = TextFormField(
      controller: _passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(
          Icons.security,
          color: Colors.lime[900],
        ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF827717), width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        onPressed: () {
          authentication();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lime[900],
        child:
            Text('LOGIN', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('/forgot_page');
      },
    );

    // ignore: non_constant_identifier_names
    final SignupLabel = Container(
      margin: EdgeInsets.only(left: 110, right: 100),
      child: FlatButton(
        child: Text(
          'Sign up here!',
          style: TextStyle(color: Colors.lime[900]),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/Registration_page');
        },
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Image.asset(
                'image/logoo.jpeg',
                width: 700,
                height: 200,
              ),
            ),
            Center(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                key: _formkey,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 200),
                children: <Widget>[
                  email,
                  SizedBox(height: 25.0),
                  password,
                  SizedBox(height: 25.0),
                  loginButton,
                  forgotLabel,
                  SizedBox(height: 70.0),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 650, left: 130),
                child: Text(
                  "New user?",
                  style: TextStyle(color: Colors.black54),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 610, left: 80),
              child: ListView(
                children: [
                  SignupLabel,
                ],
              ),
            )
          ],
        ));
  }
}
