// To parse this JSON data, do
//
//     final ledgerDetails2Model = ledgerDetails2ModelFromJson(jsonString);

import 'dart:convert';

LedgerDetails2Model ledgerDetails2ModelFromJson(String str) => LedgerDetails2Model.fromJson(json.decode(str));

String ledgerDetails2ModelToJson(LedgerDetails2Model data) => json.encode(data.toJson());

class LedgerDetails2Model {
    String? list;

    LedgerDetails2Model({
        this.list,
    });

    factory LedgerDetails2Model.fromJson(Map<String, dynamic> json) => LedgerDetails2Model(
        list: json["list"],
    );

    Map<String, dynamic> toJson() => {
        "list": list,
    };
}
