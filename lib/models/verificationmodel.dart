import 'dart:convert';

VerificationCodeModel verificationCodeModelFromJson(String str) =>
    VerificationCodeModel.fromJson(json.decode(str));

String verificationCodeModelToJson(VerificationCodeModel data) =>
    json.encode(data.toJson());

class VerificationCodeModel {
  VerificationCodeModel({
    this.email,
    this.verificationCode,
  });

  String email;
  int verificationCode;

  factory VerificationCodeModel.fromJson(Map<String, dynamic> json) =>
      VerificationCodeModel(
        email: json["email"],
        verificationCode: json["verification_code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "verification_code": verificationCode,
      };
}
