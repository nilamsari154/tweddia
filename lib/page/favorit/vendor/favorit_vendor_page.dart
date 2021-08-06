import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';

class FavoritVendorScreen extends StatelessWidget {
  final String name_vendor;
  final VoidCallback ontap;
  final String address;
  final String kelas;
  const FavoritVendorScreen(
      {Key key, this.name_vendor, this.address, this.kelas, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 24),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kPrimaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        name_vendor,
                        style: new TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                child: Row(children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 350,
                        child: Text(
                          address,
                          style: new TextStyle(
                            fontSize: 14.0,
                          ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
