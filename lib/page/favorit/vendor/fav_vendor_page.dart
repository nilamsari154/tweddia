import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tweddia/page/favorit/vendor/favorit_vendor_page.dart';
import 'package:tweddia/page/profile/detail_page/body.dart';
import 'package:tweddia/service/userdataservice.dart';
import 'package:tweddia/models/favorit.dart';

import '../../../constans.dart';

class FavoritVendorPage extends StatefulWidget {
  @override
  _FavoritVendorPageState createState() => _FavoritVendorPageState();
}

class _FavoritVendorPageState extends State<FavoritVendorPage> {
  int selectedIndex = 0;

  Favoritmodel favoritmodel = new Favoritmodel();
  String key_id = "0";
  bool isLoading = true;
  List<Favoritmodel> listfavoritModel = [];

  @override
  void initState() {
    readfavorit();
    super.initState();
  }

  void readfavorit() {
    setState(() {
      isLoading = true;
    });
    UserdataServices.readfavorit(null).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        listfavoritModel = List<Favoritmodel>.from(
            result.content.map((x) => Favoritmodel.fromJson(x)));
        print(listfavoritModel);
      } else {
        print("eror message : " + result.message);
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: kDefaultPadding * 2,
                    left: kDefaultPadding * 6,
                    right: kDefaultPadding * 6),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'image/favorit.png',
                      width: 180,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (Favoritmodel item in listfavoritModel)
                      FavoritVendorScreen(
                        name_vendor: item.nameVendor,
                        address: item.address,
                        kelas: "",
                        ontap: () {},
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
