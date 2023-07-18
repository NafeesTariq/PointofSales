import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/ItemsDetailsByItemId.dart';
import 'package:quest/models/LedgerBalanceModel.dart';

class LegderBalanceController extends GetxController {
  var balance = GetLedgerBalanceModel();

  Api_Provider api_provider = Api_Provider();

  GetLedgerBalance({required double detailedCode}) async {
    await api_provider
        .getLedgerBalance(detailedCode: detailedCode)
        .then((value) {
      balance = value!;
      Get.log("Balance is ${balance.balance}");
      print("Ledger Balane API OKkkkkkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
