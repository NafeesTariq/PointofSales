import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/ItemDetailByCode.dart';
import 'package:quest/models/ItemsDetailsByItemId.dart';

class ItemDetailsbyCodeController extends GetxController {
  var list =  GetdetailsbybCodeModel( );
  Api_Provider api_provider = Api_Provider();

  getitemdetailsbyCode({required int? id,required int code}) async {
    await api_provider.getItemDetailsbyCode(id: id,detailedCode:code ).then((value) {
      list = value!;
      // print("${list.data!.salePrice!}");
      // print("Sale Price ${list.data!.salePrice}");
      print("Item Name........ ${list.data!.itemName}");
      print('last price.... : ${list.data!.lastSalePrice}');
      print("Item Details by Item ID Okkkkkkk");
    });
  }

  @override
  void onInit() {
    super.onInit();
  }
}
