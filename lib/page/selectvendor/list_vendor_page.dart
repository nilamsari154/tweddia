import 'package:flutter/material.dart';
import 'package:tweddia/constans.dart';

class ListvendorPage extends StatelessWidget {
  final String name_vendor;
  final VoidCallback ontap;
  final String address;
  const ListvendorPage({Key key, this.name_vendor, this.address, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kPrimaryColor,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Card(
          elevation: 10,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
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
      ),
      onTap: ontap,
    );
  }
}
