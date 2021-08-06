import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/favorit.dart';
import 'package:tweddia/page/detail_vendor/data_profile.dart';
import 'package:tweddia/page/detail_vendor/detail_produk/detail_produk_page.dart';
import 'package:tweddia/page/detail_vendor/model_data.dart';
import 'package:tweddia/service/userdataservice.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailvendorPage extends StatefulWidget {
  final String idVendor;
  final String nameVendor;
  final String jenisVendor;
  final String address;
  final String jamKerja;
  final String deskripsi;
  final String handphone;
  final String email;
  DetailvendorPage(this.idVendor, this.nameVendor, this.jenisVendor,
      this.address, this.jamKerja, this.deskripsi, this.handphone, this.email,
      {key})
      : super(key: key);

  @override
  _DetailvendorPageState createState() => _DetailvendorPageState();
}

class _DetailvendorPageState extends State<DetailvendorPage> {
  @override
  Profile profile;
  var locationMessage = '';
  String latitude;
  String longitude;

  @override
  void initState() {
    profile = AppData.profiles[0];
    super.initState();
    getCurrentLocation();
    readUserData();
  }

  String key_id = "0";
  bool isLoading = false;

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
  }

  void insertfavorit() {
    setState(() {
      isLoading = true;
    });
    Favoritmodel favoritmodel = new Favoritmodel(
        idUser: key_id,
        idVendor: widget.idVendor,
        nameVendor: widget.nameVendor,
        address: widget.address);

    var requestBody = jsonEncode(favoritmodel.toJson());
    UserdataServices.insertfavorit(requestBody)
        .then((value) {})
        .catchError((error) {});
    setState(() {
      isLoading = false;
    });
  }

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;

    // passing this to latitude and longitude strings
    latitude = "$lat";
    longitude = "$long";

    setState(() {
      locationMessage = "Latitude: $lat and Longitude: $long";
    });
  }

  // function for opening it in google maps

  void googleMap() async {
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else
      throw ("Couldn't open google maps");
  }

  @override
  Widget build(BuildContext context) {
    bool like = false;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
          ListView(
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Image.asset('image/ic_back2.png'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Image.asset('image/profil.JPG'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.nameVendor,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 35,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.jamKerja,
                              style: TextStyle(color: Colors.red),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.only(),
                                primary: Colors.red,
                                textStyle: const TextStyle(fontSize: 13),
                              ),
                              onPressed: () {
                                googleMap();
                              },
                              child: Text(widget.address),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    like = true;
                                  });
                                  insertfavorit();
                                },
                                child: like == true
                                    ? Image.asset(
                                        'image/icon_hati2.png',
                                        width: 25,
                                        color: kPrimaryColor,
                                      )
                                    : Image.asset(
                                        'image/icon_hati.png',
                                        width: 25,
                                        color: Colors.red,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.jenisVendor,
                      style: TextStyle(fontSize: 25, color: kPrimaryColor),
                    ),
                    Text(
                      widget.deskripsi,
                      style: TextStyle(fontSize: 14, color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kPrimaryColor,
                        ),
                        Text(
                          widget.handphone,
                          style: TextStyle(fontSize: 14, color: kPrimaryColor),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: kPrimaryColor,
                        ),
                        Text(
                          widget.email,
                          style: TextStyle(fontSize: 14, color: kPrimaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Wrap(
                  children: <Widget>[
                    for (int i = 0; i < AppData.profiles.length; i++)
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                            return new DetailprodukPage(
                                AppData.profiles[i].imageUrl,
                                AppData.profiles[i].name,
                                AppData.profiles[i].jumlah,
                                AppData.profiles[i].deskripsi,
                                AppData.profiles[i].harga,
                                widget.nameVendor);
                          }));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3,
                          width: 400 / 3,
                          margin: EdgeInsets.only(left: 6, top: 3, bottom: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: kPrimaryColor,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: AssetImage(AppData.profiles[i].imageUrl),
                              )),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
