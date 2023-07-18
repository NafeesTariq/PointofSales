// To parse this JSON data, do
//
//     final recoveryModel = recoveryModelFromJson(jsonString);

import 'dart:convert';

RecoveryModel recoveryModelFromJson(String str) =>
    RecoveryModel.fromJson(json.decode(str));

String recoveryModelToJson(RecoveryModel data) => json.encode(data.toJson());

class RecoveryModel {
  String? returnId;
  String? returnMessage;

  RecoveryModel({
    this.returnId,
    this.returnMessage,
  });

  factory RecoveryModel.fromJson(Map<String, dynamic> json) => RecoveryModel(
        returnId: json["returnId"],
        returnMessage: json["returnMessage"],
      );

  Map<String, dynamic> toJson() => {
        "returnId": returnId,
        "returnMessage": returnMessage,
      };
}
