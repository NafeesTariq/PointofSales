import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:quest/APis/api_providers.dart';

class RecoveryCOntroller extends GetxController {
  Api_Provider api_provider = Api_Provider();

  RecoveryAPi({
    required String voucherNo,
    required String voucherType,
    required String voucherDate,
    required int? detailCode,
    required String remarks,
    required String chequeNo,
    required double credit,
    required String insertUpdateDelete,
  }) {
    api_provider.PostRecovery(
            insertUpdateDelete: insertUpdateDelete,
            voucherNo: voucherNo,
            voucherType: voucherType,
            voucherDate: voucherDate,
            detailCode: detailCode!,
            remarks: remarks,
            chequeNo: chequeNo,
            credit: credit)
        .then((value) async {
      if (value!.returnMessage == "Success") {
        Get.log('----Hitted----');

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
