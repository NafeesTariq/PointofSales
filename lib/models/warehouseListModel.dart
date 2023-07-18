// To parse this JSON data, do
//
//     final wareHouseListModel = wareHouseListModelFromJson(jsonString);

import 'dart:convert';

WareHouseListModel wareHouseListModelFromJson(String str) =>
    WareHouseListModel.fromJson(json.decode(str));

String wareHouseListModelToJson(WareHouseListModel data) =>
    json.encode(data.toJson());

class WareHouseListModel {
  List<WarehouseList>? listdata;

  WareHouseListModel({
    this.listdata,
  });

  factory WareHouseListModel.fromJson(Map<String, dynamic> json) =>
      WareHouseListModel(
        listdata: json["listdata"] == null
            ? []
            : List<WarehouseList>.from(
                json["listdata"]!.map((x) => WarehouseList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listdata": listdata == null
            ? []
            : List<dynamic>.from(listdata!.map((x) => x.toJson())),
      };
}

class WarehouseList {
  int? warehouseId;
  String? warehouseName;
  dynamic status;

  WarehouseList({
    this.warehouseId,
    this.warehouseName,
    this.status,
  });

  factory WarehouseList.fromJson(Map<String, dynamic> json) => WarehouseList(
        warehouseId: json["warehouseID"],
        warehouseName: json["warehouseName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "warehouseID": warehouseId,
        "warehouseName": warehouseName,
        "status": status,
      };
}
