import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:flutter/material.dart';
import 'package:quest/models/separate_itemlist.dart';
import 'package:quest/utils/loaders.dart';

class NewController extends GetxController {
  TextEditingController searchtext = TextEditingController();
  List<Listdatas> data = [];
  var list = ItemModelNew();

  Api_Provider api_provider = Api_Provider();

  newgetItemList() async {
    await api_provider.newgetitemFromAPI(search: searchtext.text).then((value) {
      list = value!;
      print("New API  Controller Okkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
