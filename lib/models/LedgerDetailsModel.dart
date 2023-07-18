// To parse this JSON data, do
//
//     final LedgerDetailsModel = LedgerDetailsModelFromJson(jsonString);

import 'dart:convert';

LedgerDetailsModel LedgerDetailsModelFromJson(String str) =>
    LedgerDetailsModel.fromJson(json.decode(str));

String LedgerDetailsModelToJson(LedgerDetailsModel data) =>
    json.encode(data.toJson());

class LedgerDetailsModel {
  List<ListElement>? list;

  LedgerDetailsModel({
    this.list,
  });

  factory LedgerDetailsModel.fromJson(Map<String, dynamic> json) =>
      LedgerDetailsModel(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? voucherNo;
  dynamic? compositKey;
  dynamic? voucherType;
  dynamic? serialNo;
  DateTime? voucherDate;
  dynamic detailCode;
  dynamic? debit;
  dynamic? credit;
  dynamic? balance;
  dynamic refrenceNo;
  String? remarks;
  dynamic paidBy;
  dynamic receivedBy;
  dynamic chequeNo;
  dynamic status;
  dynamic insertUpdateDelete;
  dynamic detailName;
  String? voucherDateString;
  int? printSequenceNo;

  ListElement({
    this.voucherNo,
    this.compositKey,
    this.voucherType,
    this.serialNo,
    this.voucherDate,
    this.detailCode,
    this.debit,
    this.credit,
    this.balance,
    this.refrenceNo,
    this.remarks,
    this.paidBy,
    this.receivedBy,
    this.chequeNo,
    this.status,
    this.insertUpdateDelete,
    this.detailName,
    this.voucherDateString,
    this.printSequenceNo,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        voucherNo: json["voucherNo"],
        compositKey: json["compositKey"],
        voucherType: json["voucherType"],
        serialNo: json["serialNo"],
        voucherDate: json["voucherDate"] == null
            ? null
            : DateTime.parse(json["voucherDate"]),
        detailCode: json["detailCode"],
        debit: json["debit"],
        credit: json["credit"],
        balance: json["balance"],
        refrenceNo: json["refrenceNo"],
        remarks: json["remarks"],
        paidBy: json["paidBy"],
        receivedBy: json["receivedBy"],
        chequeNo: json["chequeNo"],
        status: json["status"],
        insertUpdateDelete: json["insertUpdateDelete"],
        detailName: json["detailName"],
        voucherDateString: json["voucherDateString"],
        printSequenceNo: json["printSequenceNo"],
      );

  Map<String, dynamic> toJson() => {
        "voucherNo": voucherNo,
        "compositKey": compositKey,
        "voucherType": voucherType,
        "serialNo": serialNo,
        "voucherDate": voucherDate?.toIso8601String(),
        "detailCode": detailCode,
        "debit": debit,
        "credit": credit,
        "balance": balance,
        "refrenceNo": refrenceNo,
        "remarks": remarks,
        "paidBy": paidBy,
        "receivedBy": receivedBy,
        "chequeNo": chequeNo,
        "status": status,
        "insertUpdateDelete": insertUpdateDelete,
        "detailName": detailName,
        "voucherDateString": voucherDateString,
        "printSequenceNo": printSequenceNo,
      };
}
