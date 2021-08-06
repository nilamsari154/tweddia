import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/vendormodel.dart';
import 'package:tweddia/page/detail_vendor/detail_vendor_page.dart';
import 'package:tweddia/page/selectvendor/list_vendor_page.dart';
import 'package:tweddia/service/vendorservice.dart';

class SelectvendorPage extends StatefulWidget {
  final String value;

  @override
  _SelectvendorPageState createState() => _SelectvendorPageState();
  SelectvendorPage(
    this.value, {
    Key key,
  }) : super(key: key);
}

class _SelectvendorPageState extends State<SelectvendorPage> {
  bool isLoading = true;
  List<Vendormodel> listVendorModel = [];

  @override
  void initState() {
    getDatavendor();
    super.initState();
  }

  void getDatavendor() {
    setState(() {
      isLoading = true;
    });
    Map map = {"jenis_vendor": widget.value};
    var requestBody = jsonEncode(map);
    print(requestBody);
    VendordataServices.getdatavendor(requestBody).then((value) {
      //Decode response
      final result = value;
      print(value);
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        listVendorModel = List<Vendormodel>.from(
            result.content.map((x) => Vendormodel.fromJson(x)));
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Vendor " + widget.value,
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Stack(
          children: [
            Image.asset('image/background2.JPG', fit: BoxFit.fill, width: 500),
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                for (Vendormodel item in listVendorModel)
                  ListvendorPage(
                    name_vendor: item.nameVendor,
                    address: item.address,
                    ontap: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                        return new DetailvendorPage(
                            item.idVendor,
                            item.nameVendor,
                            item.jenisVendor,
                            item.address,
                            item.jamKerja,
                            item.deskripsi,
                            item.handphone,
                            item.email);
                      }));
                    },
                  ),
              ],
            ),
          ],
        ));
  }
}
