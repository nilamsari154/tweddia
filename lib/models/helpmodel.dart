// To parse this JSON data, do
//
//     final helpmodel = helpmodelFromJson(jsonString);

import 'dart:convert';

Helpmodel helpmodelFromJson(String str) => Helpmodel.fromJson(json.decode(str));

String helpmodelToJson(Helpmodel data) => json.encode(data.toJson());

class Helpmodel {
  Helpmodel({
    this.idHelp,
    this.idUser,
    this.name,
    this.complaint,
  });

  String idHelp;
  String idUser;
  String name;
  String complaint;

  factory Helpmodel.fromJson(Map<String, dynamic> json) => Helpmodel(
        idHelp: json["id_help"],
        idUser: json["id_user"],
        name: json["name"],
        complaint: json["complaint"],
      );

  Map<String, dynamic> toJson() => {
        "id_help": idHelp,
        "id_user": idUser,
        "name": name,
        "complaint": complaint,
      };
}
