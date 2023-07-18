import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quest/APis/api_providers.dart';

class SaveStoreTransferController extends GetxController {
  Api_Provider api_provider = Api_Provider();

  SaveStoreTransfer({
    required int fromstoreid,
    required int tostoreid,
    required String ReferenceNo,
    required String remarks,
    required int userID,
    required List<Map<String, dynamic>> invoiceDetail,
  }) {
    api_provider.SaveStoreTransferAPI(
            ReferenceNo: ReferenceNo,
            userID: userID,
            remarks: remarks,
            invoiceDetail: invoiceDetail,
            fromstoreid: fromstoreid,
            tostoreid: tostoreid)
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
