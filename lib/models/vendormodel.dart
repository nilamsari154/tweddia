// To parse this JSON data, do
//
//     final vendormodel = vendormodelFromJson(jsonString);

import 'dart:convert';

Vendormodel vendormodelFromJson(String str) =>
    Vendormodel.fromJson(json.decode(str));

String vendormodelToJson(Vendormodel data) => json.encode(data.toJson());

class Vendormodel {
  Vendormodel({
    this.idVendor,
    this.nameVendor,
    this.jenisVendor,
    this.address,
    this.jamKerja,
    this.deskripsi,
    this.handphone,
    this.email,
  });

  String idVendor;
  String nameVendor;
  String jenisVendor;
  String address;
  String jamKerja;
  String deskripsi;
  String handphone;
  String email;

  factory Vendormodel.fromJson(Map<String, dynamic> json) => Vendormodel(
        idVendor: json["id_vendor"],
        nameVendor: json["name_vendor"],
        jenisVendor: json["jenis_vendor"],
        address: json["address"],
        jamKerja: json["jam_kerja"],
        deskripsi: json["deskripsi"],
        handphone: json["handphone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id_vendor": idVendor,
        "name_vendor": nameVendor,
        "jenis_vendor": jenisVendor,
        "address": address,
        "jam_kerja": jamKerja,
        "deskripsi": deskripsi,
        "handphone": handphone,
        "email": email,
      };
}
