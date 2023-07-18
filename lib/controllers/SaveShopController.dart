import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quest/APis/api_providers.dart';

class SaveShopController extends GetxController {
  Api_Provider api_provider = Api_Provider();

  SaveShopAPI({
    required String computerNo,
    required int invoiceType,
    required int detailCode,
    required String cashCustomerName,
    required int exchangeRate,
    required String remarks,
    required double grossTotal,
    required List<Map<String, dynamic>> invoiceDetail,
  }) {
    api_provider
        .saveShopSaleAPI(
            computerNo: computerNo,
            invoiceType: invoiceType,
            detailCode: detailCode,
            cashCustomerName: cashCustomerName,
            exchangeRate: exchangeRate,
            remarks: remarks,
            grossTotal: grossTotal,
            invoiceDetail: invoiceDetail)
        .then((value) async {
      if (value!.status == "true") {
        print(value.status);

        // update();
        //   Get.to(() => DashBoard());
        // }
      }
    }).onError((error, stackTrace) {
      print("${error}");
    });
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
