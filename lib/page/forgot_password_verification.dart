import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tweddia/constans.dart';
import 'package:tweddia/models/verificationmodel.dart';
import 'package:tweddia/page/resetpassword.dart';

class OTPPage extends StatefulWidget {
  final VerificationCodeModel verificationCodeModel;
  const OTPPage({Key key, this.verificationCodeModel}) : super(key: key);
  @override
  _OTPState createState() => new _OTPState();
}

class _OTPState extends State<OTPPage> {
  TextEditingController txtCode = new TextEditingController();
  VerificationCodeModel _verificationEmail = new VerificationCodeModel();
  bool isSendEmailVerification = false;

  @override
  void dispose() {
    super.dispose();
    txtCode.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isSendEmailVerification
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
              title: Text("Verify Your Email"),
              backgroundColor: kPrimaryColor,
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Verifying your Email!",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 4.0, right: 16.0),
                          child: Text(
                            "Please type the verification code sent to your email",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 16.0, bottom: 25.0),
                            child: Image.asset('image/otp-image.jpg',
                                width: 200.0)),
                        TextFormField(
                          controller: txtCode,
                          obscureText: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 24.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 2),
                            ),
                            hintText: "PIN",
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onPressed: () {
                              verifyCode();
                            },
                            padding:
                                EdgeInsets.fromLTRB(100.0, 12.0, 100.0, 12.0),
                            color: kPrimaryColor,
                            child: Text('Verify',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 23)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void matchOtp() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid"),
            content: Text("check again your OTP code"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.check),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void verifyCode() {
    setState(() {
      isSendEmailVerification = true;
    });
    _verificationEmail = widget.verificationCodeModel;
    if (txtCode.text ==
        widget.verificationCodeModel.verificationCode.toString()) {
      //sendNewPassword();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Resetpasswordpage(verificationEmail: _verificationEmail)),
      );
    } else {
      matchOtp();
    }
    setState(() {
      isSendEmailVerification = false;
    });
  }
}
