class ItemDetailedByQrModel {
  bool? status;
  Data? data;

  ItemDetailedByQrModel({this.status, this.data});

  ItemDetailedByQrModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  static List<ItemDetailedByQrModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ItemDetailedByQrModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? itemId;
  dynamic itemName;
  dynamic urduName;
  dynamic barcode;
  dynamic uomId;
  dynamic categoryId;
  dynamic brandId;
  dynamic costPrice;
  dynamic salePrice;
  dynamic minLevel;
  dynamic maxLevel;
  dynamic minOrder;
  dynamic status;
  dynamic categoryName;
  dynamic brandName;
  dynamic uomName;
  dynamic subCategoryId;
  dynamic subCategoryName;
  dynamic minSalePrice;
  dynamic packingUom;
  dynamic qtyPerPack;
  dynamic ctnQty;
  dynamic packUomName;
  dynamic purchasePrice;
  dynamic imageName;
  dynamic imageUrl;
  dynamic lastSalePrice;
  dynamic colorId;
  dynamic colorName;
  dynamic displayUnit;

  Data(
      {this.itemId,
      this.itemName,
      this.urduName,
      this.barcode,
      this.uomId,
      this.categoryId,
      this.brandId,
      this.costPrice,
      this.salePrice,
      this.minLevel,
      this.maxLevel,
      this.minOrder,
      this.status,
      this.categoryName,
      this.brandName,
      this.uomName,
      this.subCategoryId,
      this.subCategoryName,
      this.minSalePrice,
      this.packingUom,
      this.qtyPerPack,
      this.ctnQty,
      this.packUomName,
      this.purchasePrice,
      this.imageName,
      this.imageUrl,
      this.lastSalePrice,
      this.colorId,
      this.colorName,
      this.displayUnit});

  Data.fromJson(Map<String, dynamic> json) {
    itemId = json["itemID"];
    itemName = json["itemName"];
    urduName = json["urduName"];
    barcode = json["barcode"];
    uomId = json["uomId"];
    categoryId = json["categoryID"];
    brandId = json["brandID"];
    costPrice = json["costPrice"];
    salePrice = json["salePrice"];
    minLevel = json["minLevel"];
    maxLevel = json["maxLevel"];
    minOrder = json["minOrder"];
    status = json["status"];
    categoryName = json["categoryName"];
    brandName = json["brandName"];
    uomName = json["uomName"];
    subCategoryId = json["subCategoryID"];
    subCategoryName = json["subCategoryName"];
    minSalePrice = json["minSalePrice"];
    packingUom = json["packingUOM"];
    qtyPerPack = json["qtyPerPack"];
    ctnQty = json["ctnQty"];
    packUomName = json["packUOMName"];
    purchasePrice = json["purchasePrice"];
    imageName = json["imageName"];
    imageUrl = json["imageURL"];
    lastSalePrice = json["lastSalePrice"];
    colorId = json["colorID"];
    colorName = json["colorName"];
    displayUnit = json["displayUnit"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["itemID"] = itemId;
    _data["itemName"] = itemName;
    _data["urduName"] = urduName;
    _data["barcode"] = barcode;
    _data["uomId"] = uomId;
    _data["categoryID"] = categoryId;
    _data["brandID"] = brandId;
    _data["costPrice"] = costPrice;
    _data["salePrice"] = salePrice;
    _data["minLevel"] = minLevel;
    _data["maxLevel"] = maxLevel;
    _data["minOrder"] = minOrder;
    _data["status"] = status;
    _data["categoryName"] = categoryName;
    _data["brandName"] = brandName;
    _data["uomName"] = uomName;
    _data["subCategoryID"] = subCategoryId;
    _data["subCategoryName"] = subCategoryName;
    _data["minSalePrice"] = minSalePrice;
    _data["packingUOM"] = packingUom;
    _data["qtyPerPack"] = qtyPerPack;
    _data["ctnQty"] = ctnQty;
    _data["packUOMName"] = packUomName;
    _data["purchasePrice"] = purchasePrice;
    _data["imageName"] = imageName;
    _data["imageURL"] = imageUrl;
    _data["lastSalePrice"] = lastSalePrice;
    _data["colorID"] = colorId;
    _data["colorName"] = colorName;
    _data["displayUnit"] = displayUnit;
    return _data;
  }
}
