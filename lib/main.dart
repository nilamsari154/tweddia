import 'package:flutter/material.dart';
import 'package:tweddia/page/bottomnavigation.dart';
import 'package:tweddia/page/forgot_password_screen.dart';
import 'package:tweddia/page/forgot_password_verification.dart';
import 'package:tweddia/page/login_screen.dart';
import 'package:tweddia/page/registration_screen.dart';
import 'package:tweddia/page/reset_succes.dart';
import 'package:tweddia/page/resetpassword.dart';
import './page/splash_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SplasScreen',
        theme: ThemeData(),
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          '/splash_screen': (BuildContext context) => SplashScreen(),
          '/login_page': (BuildContext context) => LoginPage(),
          '/Registration_page': (BuildContext context) => RegistrationPage(),
          '/forgot_page': (BuildContext context) => ForgotpasswordPage(),
          '/Otp_page': (BuildContext context) => OTPPage(),
          '/navbar_bottom': (BuildContext context) => Bottomnavigation(),
          '/resetpassword': (BuildContext context) => Resetpasswordpage(),
          '/resetsucces': (BuildContext context) => ResetsuccesScreen(),
        });
  }
}
