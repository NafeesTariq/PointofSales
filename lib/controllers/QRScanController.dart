import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/ItemDetailedByQRScanModel.dart';

class QRscanController extends GetxController {
  Api_Provider api_provider = Api_Provider();
  ItemDetailedByQrModel? itemDetailedByQrModel;

  var count = 0.0.obs;

  List<Map<String, dynamic>> list1 = [];
  List<Map<String, dynamic>> list2 = [];

  // var list = ItemDetailedByQrModel();
  // List<ItemDetailedByQrModel> lists = [];
  TextEditingController QR_Code_text = TextEditingController();
  getQRData({required String qr_code}) async {
    await api_provider.getitemDetailbyQR(qrcode: qr_code).then((value) {
      if (value!.status == true) {
        itemDetailedByQrModel = value;
        Map<String, dynamic> responseMap = itemDetailedByQrModel!.toJson();
        var Qrdata = responseMap;
        print("QR DATA RESPONSE MAP =${Qrdata}");

        list1.add(responseMap);
        print("My Index value is =");
        print("Hello....${list1.length}");
        print("My Index value is =${list1[0]['data']['itemID']}");
        update();
      } else {
        print("Else.....");
      }
    });
  }
}
