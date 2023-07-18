class ItemModelNew {
  List<Listdatas>? itemlist;

  ItemModelNew({this.itemlist});

  ItemModelNew.fromJson(Map<String, dynamic> json) {
    if (json['listdata'] != null) {
      itemlist = <Listdatas>[];
      json['listdata'].forEach((v) {
        itemlist!.add(new Listdatas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemlist != null) {
      data['listdata'] = this.itemlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listdatas {
  int? itemID;
  String? itemName;
  String? urduName;
  String? barcode;
  dynamic? salePrice;
  String? categoryName;
  String? brandName;
  String? uomName;
  String? subCategoryName;
  String? imageName;
  String? imageURL;

  Listdatas({
    this.itemID,
    this.itemName,
    this.urduName,
    this.barcode,
    this.salePrice,
    this.categoryName,
    this.brandName,
    this.uomName,
    this.subCategoryName,
    this.imageName,
    this.imageURL,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemID'] = this.itemID;
    data['itemNmae'] = this.imageName;
    data['urduName'] = this.urduName;
    data['barcode'] = this.barcode;
    data['salePrice'] = this.salePrice;
    data['categoryName'] = this.categoryName;
    data['brandName'] = this.brandName;
    data['uomName'] = this.uomName;
    data['subCategoryName'] = this.subCategoryName;
    data['imageName'] = this.imageName;
    data['imageUrl'] = this.imageURL;

    return data;
  }

  Listdatas.fromJson(Map<String, dynamic> json) {
    itemID = json['itemID'];
    itemName = json['itemName'];
    urduName = json['urduName'];
    barcode = json['barcode'];
    salePrice != json['salePrice'];
    categoryName = json['categoryName'];
    brandName = json['brandName'];
    uomName = json['uomName'];
    subCategoryName = json['subCategoryName'];
    imageName = json['imagename'];
    imageURL = json['imageURL'];
  }
}
