// To parse this JSON data, do
//
//     final RightsListModel = RightsListModelFromJson(jsonString);

import 'dart:convert';

RightsListModel RightsListModelFromJson(String str) =>
    RightsListModel.fromJson(json.decode(str));

String RightsListModelToJson(RightsListModel data) =>
    json.encode(data.toJson());

class RightsListModel {
  List<RightsList>? listdata;

  RightsListModel({
    this.listdata,
  });

  factory RightsListModel.fromJson(Map<String, dynamic> json) =>
      RightsListModel(
        listdata: json["listdata"] == null
            ? []
            : List<RightsList>.from(
                json["listdata"]!.map((x) => RightsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listdata": listdata == null
            ? []
            : List<dynamic>.from(listdata!.map((x) => x.toJson())),
      };
}

class RightsList {
  String? menuName;
  int? userId;
  int? showMain;

  RightsList({
    this.menuName,
    this.userId,
    this.showMain,
  });

  factory RightsList.fromJson(Map<String, dynamic> json) => RightsList(
        menuName: json["menuName"],
        userId: json["userID"],
        showMain: json["showMain"],
      );

  Map<String, dynamic> toJson() => {
        "menuName": menuName,
        "userID": userId,
        "showMain": showMain,
      };
}
