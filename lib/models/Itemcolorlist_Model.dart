import 'dart:convert';

ItemColorListModel itemColorListModelFromJson(String str) =>
    ItemColorListModel.fromJson(json.decode(str));

String itemColorListModelToJson(ItemColorListModel data) =>
    json.encode(data.toJson());

class ItemColorListModel {
  List<ItemColorListData>? listdata;

  ItemColorListModel({
    this.listdata,
  });

  factory ItemColorListModel.fromJson(Map<String, dynamic> json) =>
      ItemColorListModel(
        listdata: json["listdata"] == null
            ? []
            : List<ItemColorListData>.from(
                json["listdata"]!.map((x) => ItemColorListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listdata": listdata == null
            ? []
            : List<dynamic>.from(listdata!.map((x) => x.toJson())),
      };
}

class ItemColorListData {
  int? itemColorId;
  int? itemId;
  int? colorId;
  String? colorName;
  String? colorUrduName;

  ItemColorListData({
    this.itemColorId,
    this.itemId,
    this.colorId,
    this.colorName,
    this.colorUrduName,
  });

  factory ItemColorListData.fromJson(Map<String, dynamic> json) =>
      ItemColorListData(
        itemColorId: json["itemColorID"],
        itemId: json["itemID"],
        colorId: json["colorID"],
        colorName: json["colorName"],
        colorUrduName: json["colorUrduName"],
      );

  Map<String, dynamic> toJson() => {
        "itemColorID": itemColorId,
        "itemID": itemId,
        "colorID": colorId,
        "colorName": colorName,
        "colorUrduName": colorUrduName,
      };
}
