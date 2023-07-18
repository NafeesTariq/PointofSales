import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:flutter/material.dart';
import 'package:quest/utils/loaders.dart';

class CustomerListContoller extends GetxController {
  CustomerListmodel? customerlist;
  TextEditingController searchtext = TextEditingController();
  var list = CustomerListmodel();
  Api_Provider api_provider = Api_Provider();

  getcustomerlist() async {
    Get.log("SearchText : ${searchtext.text}");
    await api_provider
        .getCustomerlistFromAPI(search: searchtext.text)
        .then((value) {
      // openLoader();
      customerlist = value;
      list = value!;
      print("${list.customerlistdata!.length}");
      print("${list.customerlistdata}");
      print("Customer Controller Okkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
