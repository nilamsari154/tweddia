import 'dart:convert';

import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/registrationservices.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';

class RegistrationPage extends StatefulWidget {
  static String tag = 'registration-page';
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _phoneController = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  void sentRequestInsertDataUser() {
    Usermodel usermodel = new Usermodel(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        handphone: _phoneController.text);

    var requestBody = jsonEncode(usermodel.toJson());
    UserRegistrationServices.sentRequestInsertDataUser(requestBody)
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }).catchError((error) {});
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final name = TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Full Name',
        prefixIcon: Icon(
          Icons.perm_identity_sharp,
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
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

    final phone = TextFormField(
      controller: _phoneController,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Phone Number',
        prefixIcon: Icon(
          Icons.phone_android,
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

    final registrationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          sentRequestInsertDataUser();
        },
        padding: EdgeInsets.all(12),
        color: Colors.lime[900],
        child: Text('Create Account',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    // ignore: non_constant_identifier_names
    final LoginLabel = FlatButton(
      child: Text(
        'Log in',
        style: TextStyle(color: Color(0xFF827717)),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) {
            return LoginPage();
          }),
        );
      },
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
              padding: EdgeInsets.only(top: 70, left: 8),
              child: Image.asset(
                'image/logoo.jpeg',
                width: 600,
                height: 200,
              ),
            ),
            Center(
              child: ListView(
                key: _formkey,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 270),
                children: <Widget>[
                  name,
                  SizedBox(height: 15.0),
                  email,
                  SizedBox(height: 15.0),
                  password,
                  SizedBox(height: 15.0),
                  phone,
                  SizedBox(height: 20.0),
                  registrationButton,
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 750, left: 100),
                child: Text(
                  "Already have a account? ",
                  style: TextStyle(color: Colors.black54),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 710, left: 145),
              child: ListView(
                children: [
                  LoginLabel,
                ],
              ),
            )
          ],
        ));
  }
}
