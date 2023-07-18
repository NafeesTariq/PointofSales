import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/ItemsDetailsByItemId.dart';

class ItemDetailsbyIdController extends GetxController {
  var list = ItemDetailsByIdModel();
  Api_Provider api_provider = Api_Provider();

  getitemdetails({required int id}) async {
    await api_provider.getItemDetailsbyId(id: id).then((value) {
      list = value!;
      // print("${list.data!.salePrice!}");
      print("Sale Price ${list.data!.salePrice}");
      print("Item Name ${list.data!.itemName}");
      print("Item Details by Item ID Okkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
