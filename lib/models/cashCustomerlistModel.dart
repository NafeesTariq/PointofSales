// To parse this JSON data, do
//
//     final cashCustomerModel = cashCustomerModelFromJson(jsonString);

import 'dart:convert';

CashCustomerModel cashCustomerModelFromJson(String str) =>
    CashCustomerModel.fromJson(json.decode(str));

String cashCustomerModelToJson(CashCustomerModel data) =>
    json.encode(data.toJson());

class CashCustomerModel {
  List<CashCustomerListdata>? listdata;

  CashCustomerModel({
    this.listdata,
  });

  factory CashCustomerModel.fromJson(Map<String, dynamic> json) =>
      CashCustomerModel(
        listdata: json["listdata"] == null
            ? []
            : List<CashCustomerListdata>.from(
                json["listdata"]!.map((x) => CashCustomerListdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listdata": listdata == null
            ? []
            : List<dynamic>.from(listdata!.map((x) => x.toJson())),
      };
}

class CashCustomerListdata {
  String? name;

  CashCustomerListdata({
    this.name,
  });

  factory CashCustomerListdata.fromJson(Map<String, dynamic> json) =>
      CashCustomerListdata(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
