// To parse this JSON data, do
//
//     final favoritmodel = favoritmodelFromJson(jsonString);

import 'dart:convert';

Favoritmodel favoritmodelFromJson(String str) =>
    Favoritmodel.fromJson(json.decode(str));

String favoritmodelToJson(Favoritmodel data) => json.encode(data.toJson());

class Favoritmodel {
  Favoritmodel({
    this.idFavorit,
    this.idUser,
    this.idVendor,
    this.nameVendor,
    this.address,
  });

  String idFavorit;
  String idUser;
  String idVendor;
  String nameVendor;
  String address;

  factory Favoritmodel.fromJson(Map<String, dynamic> json) => Favoritmodel(
        idFavorit: json["id_favorit"],
        idUser: json["id_user"],
        idVendor: json["id_vendor"],
        nameVendor: json["name_vendor"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id_favorit": idFavorit,
        "id_user": idUser,
        "id_vendor": idVendor,
        "name_vendor": nameVendor,
        "address": address,
      };
}
