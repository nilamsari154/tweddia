import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tweddia/page/profile/detail_page/detail_profile.dart';
import 'package:tweddia/page/profile/profile/profile.dart';

import 'constans.dart';

class DetailProfilePage extends StatefulWidget {
  @override
  _DetailProfilePageState createState() => _DetailProfilePageState();
  // This widget is the root of your application.
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: kLightTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: DetailProfileScreen(),
          );
        },
      ),
    );
  }
}
