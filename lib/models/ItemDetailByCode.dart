// To parse this JSON data, do
//
//     final getdetailsbybCodeModel = getdetailsbybCodeModelFromJson(jsonString);

import 'dart:convert';

GetdetailsbybCodeModel itemDetailsByCodeModelFromJson(String str) =>
    GetdetailsbybCodeModel.fromJson(json.decode(str));

String itemDetailsByCodeModelToJson(GetdetailsbybCodeModel data) =>
    json.encode(data.toJson());

class GetdetailsbybCodeModel {
  Datass? data;

  GetdetailsbybCodeModel({
    this.data,
  });

  factory GetdetailsbybCodeModel.fromJson(Map<String, dynamic> json) =>
      GetdetailsbybCodeModel(
        data: json["data"] == null ? null : Datass.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Datass {
    int itemId;
    String itemName;
    String urduName;
    String barcode;
    // int uomId;
    // int categoryId;
    // int brandId;
    // dynamic costPrice;
    double salePrice;
    // int minLevel;
    // int maxLevel;
    // int minOrder;
    // String status;
    // String categoryName;
    // String brandName;
    // String uomName;
    // int subCategoryId;
    // String subCategoryName;
    // dynamic minSalePrice;
    // dynamic packingUom;
    // dynamic qtyPerPack;
    // dynamic ctnQty;
    // dynamic packUomName;
    // dynamic purchasePrice;
    // String imageName;
    // String imageUrl;
    dynamic lastSalePrice;
    // dynamic colorId;
    // dynamic colorName;
    // dynamic displayUnit;

    Datass({
        required this.itemId,
        required this.itemName,
        required this.urduName,
        required this.barcode,
        // required this.uomId,
        // required this.categoryId,
        // required this.brandId,
        // this.costPrice,
        required this.salePrice,
        // required this.minLevel,
        // required this.maxLevel,
        // required this.minOrder,
        // required this.status,
        // required this.categoryName,
        // required this.brandName,
        // required this.uomName,
        // required this.subCategoryId,
        // required this.subCategoryName,
        // this.minSalePrice,
        // this.packingUom,
        // this.qtyPerPack,
        // this.ctnQty,
        // this.packUomName,
        // this.purchasePrice,
        // required this.imageName,
        // required this.imageUrl,
        this.lastSalePrice,
        // this.colorId,
        // this.colorName,
        // this.displayUnit,
    });

    factory Datass.fromJson(Map<String, dynamic> json) => Datass(
        itemId: json["itemID"],
        itemName: json["itemName"],
        urduName: json["urduName"],
        barcode: json["barcode"],
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
        "barcode": barcode,
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
