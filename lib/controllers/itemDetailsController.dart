import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/LedgerDetailsModel.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:flutter/material.dart';

class LedgerDetailsController extends GetxController {
  LedgerDetailsModel? ledgerdetailslist;

  Api_Provider api_provider = Api_Provider();

  getledgerDetails(
      {required double detailedCode,
      required String fromDate,
      required String todate}) async {
    await api_provider
        .getLedgerDetails(
            detailedCode: detailedCode, fromDate: fromDate, todate: todate)
        .then((value) {
      ledgerdetailslist = value;
      Get.log(".....${ledgerdetailslist!.list!.length}");

      print("Ledger Details API OKkkkkkk");
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }
}
