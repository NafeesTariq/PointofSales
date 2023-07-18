import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/Itemcolorlist_Model.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:flutter/material.dart';

class ItemColorListController extends GetxController {
  ItemColorListModel? itemColorList;
  var list = ItemColorListModel();
  Api_Provider api_provider = Api_Provider();

  Future getItemColorList({required int id}) async {
    await api_provider.getItemColorListFromAPI(id: id).then((value) {
      itemColorList = value;
      list = value!;
      print("color Detailssss : ${list.listdata!.length}");
      // customerlist = value;
      // list = value!;
      // print("${list.customerlistdata!.length}");
      // print("Customer Controller Okkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
