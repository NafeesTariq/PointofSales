// To parse this JSON data, do
//
//     final itemDetailsByIdModel = itemDetailsByIdModelFromJson(jsonString);

import 'dart:convert';

ItemDetailsByIdModel itemDetailsByIdModelFromJson(String str) =>
    ItemDetailsByIdModel.fromJson(json.decode(str));

String itemDetailsByIdModelToJson(ItemDetailsByIdModel data) =>
    json.encode(data.toJson());

class ItemDetailsByIdModel {
  Data? data;

  ItemDetailsByIdModel({
    this.data,
  });

  factory ItemDetailsByIdModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailsByIdModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? itemId;
  String? itemName;
  String? urduName;
  dynamic? salePrice;
  // String? barcode;
  // double? uomId;
  // double? categoryId;
  // double? brandId;
  // dynamic costPrice;
  // double? minLevel;
  // double? maxLevel;
  // double? minOrder;
  // String? status;
  // String? categoryName;
  // String? brandName;
  // int? uomName;
  // double? subCategoryId;
  // String? subCategoryName;
  // dynamic minSalePrice;
  // double? packingUom;
  // double? qtyPerPack;
  // double? ctnQty;
  // dynamic packUomName;
  // double? purchasePrice;
  // String? imageName;
  // String? imageUrl;
  double? lastSalePrice;
  // dynamic colorId;
  // dynamic colorName;
  // double? displayUnit;

  Data({
    this.itemId,
    this.itemName,
    this.urduName,
    // this.barcode,
    // this.uomId,
    // this.categoryId,
    // this.brandId,
    // required brandName,
    // this.costPrice,
    this.salePrice,
    // this.minLevel,
    // this.maxLevel,
    // this.minOrder,
    // this.status,
    // this.categoryName,
    // this.brandName,
    // this.uomName,
    // this.subCategoryId,
    // this.subCategoryName,
    // this.minSalePrice,
    // this.packingUom,
    // this.qtyPerPack,
    // this.ctnQty,
    // this.packUomName,
    // this.purchasePrice,
    // this.imageName,
    // this.imageUrl,
    this.lastSalePrice,
    // this.colorId,
    // this.colorName,
    // this.displayUnit,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        itemId: json["itemID"],
        itemName: json["itemName"],
        urduName: json["urduName"],
        // barcode: json["barcode"],
        // uomId: json["uomId"],
        // categoryId: json["categoryID"],
        // brandId: json["brandID"],
        // costPrice: json["costPrice"],
        salePrice: json["salePrice"],
        // minLevel: json["minLevel"],
        // maxLevel: json["maxLevel"],
        // minOrder: json["minOrder"],
        // status: json["status"],
        // categoryName: json["categoryName"],
        // brandName: json["brandName"],
        // uomName: json["uomName"],
        // subCategoryId: json["subCategoryID"],
        // subCategoryName: json["subCategoryName"],
        // minSalePrice: json["minSalePrice"],
        // packingUom: json["packingUOM"],
        // qtyPerPack: json["qtyPerPack"],
        // ctnQty: json["ctnQty"],
        // packUomName: json["packUOMName"],
        // purchasePrice: json["purchasePrice"],
        // imageName: json["imageName"],
        // imageUrl: json["imageURL"],
        lastSalePrice: json["lastSalePrice"],
        // colorId: json["colorID"],
        // colorName: json["colorName"],
        // displayUnit: json["displayUnit"],
      );

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "itemName": itemName,
        "urduName": urduName,
        // "barcode": barcode,
        // "uomId": uomId,
        // "categoryID": categoryId,
        // "brandID": brandId,
        // "costPrice": costPrice,
        "salePrice": salePrice,
        // "minLevel": minLevel,
        // "maxLevel": maxLevel,
        // "minOrder": minOrder,
        // "status": status,
        // "categoryName": categoryName,
        // "brandName": brandName,
        // "uomName": uomName,
        // "subCategoryID": subCategoryId,
        // "subCategoryName": subCategoryName,
        // "minSalePrice": minSalePrice,
        // "packingUOM": packingUom,
        // "qtyPerPack": qtyPerPack,
        // "ctnQty": ctnQty,
        // "packUOMName": packUomName,
        // "purchasePrice": purchasePrice,
        // "imageName": imageName,
        // "imageURL": imageUrl,
        "lastSalePrice": lastSalePrice,
        // "colorID": colorId,
        // "colorName": colorName,
        // "displayUnit": displayUnit,
      };
}
