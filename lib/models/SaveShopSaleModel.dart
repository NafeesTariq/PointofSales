import 'dart:convert';

SaveShopSale saveShopSaleFromJson(String str) =>
    SaveShopSale.fromJson(json.decode(str));

String saveShopSaleToJson(SaveShopSale data) => json.encode(data.toJson());

class SaveShopSale {
  bool status;
  String returnId;
  String returnMessage;

  SaveShopSale({
    required this.status,
    required this.returnId,
    required this.returnMessage,
  });

  factory SaveShopSale.fromJson(Map<String, dynamic> json) => SaveShopSale(
        status: json["status"],
        returnId: json["returnId"],
        returnMessage: json["returnMessage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "returnId": returnId,
        "returnMessage": returnMessage,
      };
}
