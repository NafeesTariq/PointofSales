class User {
  final int? itemId;
  final String barcode;
  final int salePrice;

  User({
    this.itemId,
    required this.barcode,
    required this.salePrice,
  });

  User.fromMap(Map<String, dynamic> res)
      : itemId = res["itemId"],
        barcode = res["barcode"],
        salePrice = res["salePrice"];
//item name, urdu name, qty,gross value, Color id, color name
  Map<String, Object?> toMap() {
    return {'itemId': itemId, 'barcode': barcode, 'salePrice': salePrice};
  }
}
