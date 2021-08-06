import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/constanta.dart';
import 'package:tweddia/models/usermodel.dart';
import 'package:tweddia/page/edit_profile/constans.dart';
import 'package:tweddia/page/edit_profile/succes_page.dart';
import 'package:tweddia/page/home/home_screen.dart';
import 'package:tweddia/page/profile/detail_page/body.dart';
import 'package:tweddia/service/apiresponse.dart';
import 'package:tweddia/service/userdataservice.dart';

// import 'list_item.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilepageState createState() => _EditProfilepageState();
  // This widget is l root of your application.
}

class _EditProfilepageState extends State<EditProfilePage> {
  var _nameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _handphoneController = new TextEditingController();
  ApiResponse apiResponse;
  int selectedIndex = 0;

  Usermodel usermodel = new Usermodel();
  String key_id = "0";
  bool isLoading = true;

  @override
  void initState() {
    readUserData();
    super.initState();
  }

  void readUserData() async {
    final storage = FlutterSecureStorage();
    key_id = await storage.read(key: Constanta.keyId);
    getDataUserLogin();
  }

  void getDataUserLogin() {
    setState(() {
      isLoading = true;
    });
    Map map = {
      "id": key_id,
    };
    var requestBody = jsonEncode(map);
    UserdataServices.getdatauser(requestBody).then((value) {
      //Decode response
      final result = value;
      //check status
      if (result.success == true && result.code == 200) {
        //parse model and return value
        usermodel = Usermodel.fromJson(result.content);
        _nameController.text = usermodel.name;
        _emailController.text = usermodel.email;
        _handphoneController.text = usermodel.handphone;
        setState(() {
          isLoading = false;
        });
      } else {}
    });
  }

  void updatedatauser() {
    String id;
    id = usermodel.id;
    Map map = {
      "id": id,
      "name": _nameController.text,
      "email": _emailController.text,
      "handphone": _handphoneController.text
    };
    var requestBody = jsonEncode(map);
    UserdataServices.updatedatauser(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        _successDialog();
      } else {
        _failedDialog();
      }
    }).catchError((error) {
      _failedDialog();
    });
    print(requestBody);
  }

  Future<void> _successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Your Profile is Updated!"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/navbar_bottom');
                },
              ),
            ],
          );
        });
  }

  Future<void> _failedDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Failed"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Oops, something went wrong"),
                  Text("Please check all the possible mistakes"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('image/ic_orang.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          SizedBox(height: kSpacingUnit.w * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    final name = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "Full Name",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Full Name',
                prefixIcon: Icon(
                  Icons.perm_identity_sharp,
                  color: kPrimaryColor,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));

    final email = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "Email",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: kPrimaryColor,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));
    final phone = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              child: Text(
                "phone",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black),
              ),
            ),
            TextFormField(
              controller: _handphoneController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'phone',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: kPrimaryColor,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ));

    final save = Padding(
      padding: EdgeInsets.only(left: 100, right: 100),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          updatedatauser();
        },
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
        color: kPrimaryColor,
        child:
            Text('Save', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          ListView(
            // key: _formkey,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            children: <Widget>[
              SizedBox(height: kSpacingUnit.w * 5),
              header,
              SizedBox(height: kSpacingUnit.w * 2),
              name,
              SizedBox(height: kSpacingUnit.w * 2),
              email,
              SizedBox(height: kSpacingUnit.w * 2),
              phone,
              SizedBox(height: kSpacingUnit.w * 4),
              save,
            ],
          ),
        ],
      ),
    );
  }
}
