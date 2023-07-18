import 'dart:convert';

GetLedgerBalanceModel GetLedgerBalanceModelFromJson(String str) =>
    GetLedgerBalanceModel.fromJson(json.decode(str));

String GetLedgerBalanceModelToJson(GetLedgerBalanceModel data) =>
    json.encode(data.toJson());

class GetLedgerBalanceModel {
  int? balance;

  GetLedgerBalanceModel({
    this.balance,
  });

  factory GetLedgerBalanceModel.fromJson(Map<String, dynamic> json) =>
      GetLedgerBalanceModel(
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
