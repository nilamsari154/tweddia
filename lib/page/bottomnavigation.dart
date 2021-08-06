/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/page/about.dart';
import 'package:tweddia/page/favorit/vendor/fav_vendor_page.dart';
import 'package:tweddia/page/favorit/vendor/favorit_vendor_page.dart';
import 'package:tweddia/page/home/home_screen.dart';
import 'package:tweddia/page/profile/profile/body.dart';
import 'package:tweddia/page/profile/profile/profile.dart';
import 'package:tweddia/page/weeding_organizer.dart';

/// This is the stateful widget that the main application instantiates.
class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BottomnavigationState extends State<Bottomnavigation> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    WoPage(),
    FavoritVendorPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("image/icon_wo.png"),
            ),
            label: 'Wedding',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("image/icon_hati.png"),
            ),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
