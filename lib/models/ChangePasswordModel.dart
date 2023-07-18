// To parse this JSON data, do
//
//     final ChangePasswordModel = ChangePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel ChangePasswordModelFromJson(String str) =>
    ChangePasswordModel.fromJson(json.decode(str));

String ChangePasswordModelToJson(ChangePasswordModel data) =>
    json.encode(data.toJson());

class ChangePasswordModel {
  bool? status;
  String? message;

  ChangePasswordModel({
    this.status,
    this.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
