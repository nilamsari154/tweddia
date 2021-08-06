import 'dart:convert';

import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/helpmodel.dart';
import 'package:tweddia/page/profile/profile/body.dart';
import 'package:tweddia/service/userdataservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  var _nameController = new TextEditingController();
  var _complaintController = new TextEditingController();
  String key_id = "0";
  bool isLoading = false;

  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
  }

  void inserthelp() {
    setState(() {
      isLoading = true;
    });
    Helpmodel helpmodel = new Helpmodel(
        name: _nameController.text,
        complaint: _complaintController.text,
        idUser: key_id);

    var requestBody = jsonEncode(helpmodel.toJson());
    UserdataServices.inserthelp(requestBody).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) {
          return ProfilePage();
        }),
      );
    }).catchError((error) {});
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Help & Support",
                style: TextStyle(color: Colors.white),
              ),
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: kPrimaryColor,
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 5,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: _nameController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 20.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.green, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Complaint',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                TextField(
                                  controller: _complaintController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  minLines: 1,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: 'what is your complaint?',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 0.0, 20.0, 100.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.green, width: 2.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  // padding: EdgeInsets.only(left: 113, right: 110),
                                  child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    onPressed: () {
                                      inserthelp();
                                    },
                                    padding: EdgeInsets.all(12),
                                    color: kPrimaryColor,
                                    child: Text('Save',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                )
                              ],
                            )),
                      )),
                ],
              ),
            ),
          );
  }
}
