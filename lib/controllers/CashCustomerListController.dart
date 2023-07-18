import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/Loca_Services/CheckInternet.dart';
import 'package:quest/models/cashCustomerlistModel.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:flutter/material.dart';
import 'package:quest/utils/loaders.dart';

import '../utils/utils.dart';

class CashCustomerListContoller extends GetxController {
  CheckInternet checkInternet = CheckInternet();
  CashCustomerModel? customerlist;
  TextEditingController searchtext = TextEditingController();
  var list = CashCustomerModel();
  Api_Provider api_provider = Api_Provider();

  getcashCustomerlist(BuildContext context) async {
    // openLoader();

    await api_provider
        .getCashCustomerlistFromAPI(search: searchtext.text.toString())
        .then((value) {
      customerlist = value;
      list = value!;
      Get.log('Length is ${customerlist!.listdata!.length}');
      Get.log("Length of List ${list.listdata!.length}");
    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage('Technical Issue', context);
    });
  }
}
