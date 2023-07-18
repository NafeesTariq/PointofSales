// To parse this JSON data, do
//
//     final saveStoreTransferModel = saveStoreTransferModelFromJson(jsonString);

import 'dart:convert';

SaveStoreTransferModel saveStoreTransferModelFromJson(String str) =>
    SaveStoreTransferModel.fromJson(json.decode(str));

String saveStoreTransferModelToJson(SaveStoreTransferModel data) =>
    json.encode(data.toJson());

class SaveStoreTransferModel {
  String? computerNo;
  String? type;
  DateTime? recordDate;
  int? detailCode;
  String? refrenceNo;
  String? remarks;
  int? grossTotal;
  String? discountType;
  int? discount;
  int? netDiscount;
  int? overhead;
  int? freight;
  int? netAmount;
  int? received;
  int? receivedDetailCode;
  int? receivedAmount;
  String? receivedRemarks;
  int? balanceAmount;
  String? status;
  int? businessId;
  int? userId;
  String? lastUserId;
  DateTime? saveDateTime;
  DateTime? lastEditDateTime;
  int? previousBalance;
  int? creditDays;
  int? fiscalYearId;
  String? reason;
  int? invoiceType;
  String? cashCustomerName;
  int? showBalance;
  int? noDueDateAlert;
  int? subDetailCode;
  int? currencyId;
  int? exchangeRate;
  String? isNewOrEdit;
  List<InvoiceDetail>? invoiceDetail;
  InvoiceExtra? invoiceExtra;
  List<InvoiceDetailColor>? invoiceDetailColor;
  String? transporter;
  String? biltyNo;
  String? biltyPacking;
  DateTime? biltyDate;
  int? biltyPending;
  int? salesmanId;
  String? address;
  String? shopNo;
  String? shippingMark;
  int? fromWarehouseId;
  int? toWarehouseId;

  SaveStoreTransferModel({
    this.computerNo,
    this.type,
    this.recordDate,
    this.detailCode,
    this.refrenceNo,
    this.remarks,
    this.grossTotal,
    this.discountType,
    this.discount,
    this.netDiscount,
    this.overhead,
    this.freight,
    this.netAmount,
    this.received,
    this.receivedDetailCode,
    this.receivedAmount,
    this.receivedRemarks,
    this.balanceAmount,
    this.status,
    this.businessId,
    this.userId,
    this.lastUserId,
    this.saveDateTime,
    this.lastEditDateTime,
    this.previousBalance,
    this.creditDays,
    this.fiscalYearId,
    this.reason,
    this.invoiceType,
    this.cashCustomerName,
    this.showBalance,
    this.noDueDateAlert,
    this.subDetailCode,
    this.currencyId,
    this.exchangeRate,
    this.isNewOrEdit,
    this.invoiceDetail,
    this.invoiceExtra,
    this.invoiceDetailColor,
    this.transporter,
    this.biltyNo,
    this.biltyPacking,
    this.biltyDate,
    this.biltyPending,
    this.salesmanId,
    this.address,
    this.shopNo,
    this.shippingMark,
    this.fromWarehouseId,
    this.toWarehouseId,
  });

  factory SaveStoreTransferModel.fromJson(Map<String, dynamic> json) =>
      SaveStoreTransferModel(
        computerNo: json["computerNo"],
        type: json["type"],
        recordDate: json["recordDate"] == null
            ? null
            : DateTime.parse(json["recordDate"]),
        detailCode: json["detailCode"],
        refrenceNo: json["refrenceNo"],
        remarks: json["remarks"],
        grossTotal: json["grossTotal"],
        discountType: json["discountType"],
        discount: json["discount"],
        netDiscount: json["netDiscount"],
        overhead: json["overhead"],
        freight: json["freight"],
        netAmount: json["netAmount"],
        received: json["received"],
        receivedDetailCode: json["receivedDetailCode"],
        receivedAmount: json["receivedAmount"],
        receivedRemarks: json["receivedRemarks"],
        balanceAmount: json["balanceAmount"],
        status: json["status"],
        businessId: json["businessID"],
        userId: json["userID"],
        lastUserId: json["lastUserID"],
        saveDateTime: json["saveDateTime"] == null
            ? null
            : DateTime.parse(json["saveDateTime"]),
        lastEditDateTime: json["lastEditDateTime"] == null
            ? null
            : DateTime.parse(json["lastEditDateTime"]),
        previousBalance: json["previousBalance"],
        creditDays: json["creditDays"],
        fiscalYearId: json["fiscalYearID"],
        reason: json["reason"],
        invoiceType: json["invoiceType"],
        cashCustomerName: json["cashCustomerName"],
        showBalance: json["showBalance"],
        noDueDateAlert: json["noDueDateAlert"],
        subDetailCode: json["subDetailCode"],
        currencyId: json["currencyID"],
        exchangeRate: json["exchangeRate"],
        isNewOrEdit: json["isNewOrEdit"],
        invoiceDetail: json["invoiceDetail"] == null
            ? []
            : List<InvoiceDetail>.from(
                json["invoiceDetail"]!.map((x) => InvoiceDetail.fromJson(x))),
        invoiceExtra: json["invoiceExtra"] == null
            ? null
            : InvoiceExtra.fromJson(json["invoiceExtra"]),
        invoiceDetailColor: json["invoiceDetailColor"] == null
            ? []
            : List<InvoiceDetailColor>.from(json["invoiceDetailColor"]!
                .map((x) => InvoiceDetailColor.fromJson(x))),
        transporter: json["transporter"],
        biltyNo: json["biltyNo"],
        biltyPacking: json["biltyPacking"],
        biltyDate: json["biltyDate"] == null
            ? null
            : DateTime.parse(json["biltyDate"]),
        biltyPending: json["biltyPending"],
        salesmanId: json["salesmanID"],
        address: json["address"],
        shopNo: json["shopNo"],
        shippingMark: json["shippingMark"],
        fromWarehouseId: json["fromWarehouseID"],
        toWarehouseId: json["toWarehouseID"],
      );

  Map<String, dynamic> toJson() => {
        "computerNo": computerNo,
        "type": type,
        "recordDate": recordDate?.toIso8601String(),
        "detailCode": detailCode,
        "refrenceNo": refrenceNo,
        "remarks": remarks,
        "grossTotal": grossTotal,
        "discountType": discountType,
        "discount": discount,
        "netDiscount": netDiscount,
        "overhead": overhead,
        "freight": freight,
        "netAmount": netAmount,
        "received": received,
        "receivedDetailCode": receivedDetailCode,
        "receivedAmount": receivedAmount,
        "receivedRemarks": receivedRemarks,
        "balanceAmount": balanceAmount,
        "status": status,
        "businessID": businessId,
        "userID": userId,
        "lastUserID": lastUserId,
        "saveDateTime": saveDateTime?.toIso8601String(),
        "lastEditDateTime": lastEditDateTime?.toIso8601String(),
        "previousBalance": previousBalance,
        "creditDays": creditDays,
        "fiscalYearID": fiscalYearId,
        "reason": reason,
        "invoiceType": invoiceType,
        "cashCustomerName": cashCustomerName,
        "showBalance": showBalance,
        "noDueDateAlert": noDueDateAlert,
        "subDetailCode": subDetailCode,
        "currencyID": currencyId,
        "exchangeRate": exchangeRate,
        "isNewOrEdit": isNewOrEdit,
        "invoiceDetail": invoiceDetail == null
            ? []
            : List<dynamic>.from(invoiceDetail!.map((x) => x.toJson())),
        "invoiceExtra": invoiceExtra?.toJson(),
        "invoiceDetailColor": invoiceDetailColor == null
            ? []
            : List<dynamic>.from(invoiceDetailColor!.map((x) => x.toJson())),
        "transporter": transporter,
        "biltyNo": biltyNo,
        "biltyPacking": biltyPacking,
        "biltyDate": biltyDate?.toIso8601String(),
        "biltyPending": biltyPending,
        "salesmanID": salesmanId,
        "address": address,
        "shopNo": shopNo,
        "shippingMark": shippingMark,
        "fromWarehouseID": fromWarehouseId,
        "toWarehouseID": toWarehouseId,
      };
}

class InvoiceDetail {
  String? compositKey;
  String? computerNo;
  String? type;
  DateTime? recordDate;
  int? serialNo;
  int? itemId;
  int? uomId;
  int? qty;
  int? rate;
  String? discountType;
  int? discount;
  int? netRate;
  int? grossValue;
  int? tax1Id;
  String? tax1Name;
  int? tax1Rate;
  int? tax1Value;
  int? tax2Id;
  String? tax2Name;
  int? tax2Rate;
  int? tax2Value;
  int? netValue;
  String? itemNote;
  int? inQty;
  int? outQty;
  int? avgRate;
  int? fiscalYearId;
  int? warehouseId;
  int? detailCode;
  String? detailName;
  int? invoiceType;
  String? refCompositKey;
  int? costRate;
  int? ctnQty;
  int? qtyPerCtn;
  int? looseQty;
  int? exchangeRate;
  int? valuePkr;
  int? expensePercent;
  int? colorId;
  String? colorList;

  InvoiceDetail({
    this.compositKey,
    this.computerNo,
    this.type,
    this.recordDate,
    this.serialNo,
    this.itemId,
    this.uomId,
    this.qty,
    this.rate,
    this.discountType,
    this.discount,
    this.netRate,
    this.grossValue,
    this.tax1Id,
    this.tax1Name,
    this.tax1Rate,
    this.tax1Value,
    this.tax2Id,
    this.tax2Name,
    this.tax2Rate,
    this.tax2Value,
    this.netValue,
    this.itemNote,
    this.inQty,
    this.outQty,
    this.avgRate,
    this.fiscalYearId,
    this.warehouseId,
    this.detailCode,
    this.detailName,
    this.invoiceType,
    this.refCompositKey,
    this.costRate,
    this.ctnQty,
    this.qtyPerCtn,
    this.looseQty,
    this.exchangeRate,
    this.valuePkr,
    this.expensePercent,
    this.colorId,
    this.colorList,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) => InvoiceDetail(
        compositKey: json["compositKey"],
        computerNo: json["computerNo"],
        type: json["type"],
        recordDate: json["recordDate"] == null
            ? null
            : DateTime.parse(json["recordDate"]),
        serialNo: json["serialNo"],
        itemId: json["itemID"],
        uomId: json["uomId"],
        qty: json["qty"],
        rate: json["rate"],
        discountType: json["discountType"],
        discount: json["discount"],
        netRate: json["netRate"],
        grossValue: json["grossValue"],
        tax1Id: json["tax1ID"],
        tax1Name: json["tax1Name"],
        tax1Rate: json["tax1Rate"],
        tax1Value: json["tax1Value"],
        tax2Id: json["tax2ID"],
        tax2Name: json["tax2Name"],
        tax2Rate: json["tax2Rate"],
        tax2Value: json["tax2Value"],
        netValue: json["netValue"],
        itemNote: json["itemNote"],
        inQty: json["inQty"],
        outQty: json["outQty"],
        avgRate: json["avgRate"],
        fiscalYearId: json["fiscalYearID"],
        warehouseId: json["warehouseID"],
        detailCode: json["detailCode"],
        detailName: json["detailName"],
        invoiceType: json["invoiceType"],
        refCompositKey: json["refCompositKey"],
        costRate: json["costRate"],
        ctnQty: json["ctnQty"],
        qtyPerCtn: json["qtyPerCTN"],
        looseQty: json["looseQty"],
        exchangeRate: json["exchangeRate"],
        valuePkr: json["valuePKR"],
        expensePercent: json["expensePercent"],
        colorId: json["colorID"],
        colorList: json["colorList"],
      );

  Map<String, dynamic> toJson() => {
        "compositKey": compositKey,
        "computerNo": computerNo,
        "type": type,
        "recordDate": recordDate?.toIso8601String(),
        "serialNo": serialNo,
        "itemID": itemId,
        "uomId": uomId,
        "qty": qty,
        "rate": rate,
        "discountType": discountType,
        "discount": discount,
        "netRate": netRate,
        "grossValue": grossValue,
        "tax1ID": tax1Id,
        "tax1Name": tax1Name,
        "tax1Rate": tax1Rate,
        "tax1Value": tax1Value,
        "tax2ID": tax2Id,
        "tax2Name": tax2Name,
        "tax2Rate": tax2Rate,
        "tax2Value": tax2Value,
        "netValue": netValue,
        "itemNote": itemNote,
        "inQty": inQty,
        "outQty": outQty,
        "avgRate": avgRate,
        "fiscalYearID": fiscalYearId,
        "warehouseID": warehouseId,
        "detailCode": detailCode,
        "detailName": detailName,
        "invoiceType": invoiceType,
        "refCompositKey": refCompositKey,
        "costRate": costRate,
        "ctnQty": ctnQty,
        "qtyPerCTN": qtyPerCtn,
        "looseQty": looseQty,
        "exchangeRate": exchangeRate,
        "valuePKR": valuePkr,
        "expensePercent": expensePercent,
        "colorID": colorId,
        "colorList": colorList,
      };
}

class InvoiceDetailColor {
  String? colorCompositKey;
  String? compositKey;
  String? computerNo;
  int? serialNo;
  int? itemId;
  int? colorId;
  int? ctnQty;
  int? looseQty;

  InvoiceDetailColor({
    this.colorCompositKey,
    this.compositKey,
    this.computerNo,
    this.serialNo,
    this.itemId,
    this.colorId,
    this.ctnQty,
    this.looseQty,
  });

  factory InvoiceDetailColor.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailColor(
        colorCompositKey: json["colorCompositKey"],
        compositKey: json["compositKey"],
        computerNo: json["computerNo"],
        serialNo: json["serialNo"],
        itemId: json["itemID"],
        colorId: json["colorID"],
        ctnQty: json["ctnQty"],
        looseQty: json["looseQty"],
      );

  Map<String, dynamic> toJson() => {
        "colorCompositKey": colorCompositKey,
        "compositKey": compositKey,
        "computerNo": computerNo,
        "serialNo": serialNo,
        "itemID": itemId,
        "colorID": colorId,
        "ctnQty": ctnQty,
        "looseQty": looseQty,
      };
}

class InvoiceExtra {
  String? computerNo;
  String? transporter;
  String? biltyNo;
  String? biltyPacking;
  DateTime? biltyDate;
  int? biltyPending;
  int? salesmanId;
  String? address;
  String? shopNo;
  String? shippingMark;

  InvoiceExtra({
    this.computerNo,
    this.transporter,
    this.biltyNo,
    this.biltyPacking,
    this.biltyDate,
    this.biltyPending,
    this.salesmanId,
    this.address,
    this.shopNo,
    this.shippingMark,
  });

  factory InvoiceExtra.fromJson(Map<String, dynamic> json) => InvoiceExtra(
        computerNo: json["computerNo"],
        transporter: json["transporter"],
        biltyNo: json["biltyNo"],
        biltyPacking: json["biltyPacking"],
        biltyDate: json["biltyDate"] == null
            ? null
            : DateTime.parse(json["biltyDate"]),
        biltyPending: json["biltyPending"],
        salesmanId: json["salesmanID"],
        address: json["address"],
        shopNo: json["shopNo"],
        shippingMark: json["shippingMark"],
      );

  Map<String, dynamic> toJson() => {
        "computerNo": computerNo,
        "transporter": transporter,
        "biltyNo": biltyNo,
        "biltyPacking": biltyPacking,
        "biltyDate": biltyDate?.toIso8601String(),
        "biltyPending": biltyPending,
        "salesmanID": salesmanId,
        "address": address,
        "shopNo": shopNo,
        "shippingMark": shippingMark,
      };
}
