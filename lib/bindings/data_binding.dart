import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/controllers/ItemColorListController.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/LedgerBalanceController.dart';
import 'package:quest/controllers/QRScanController.dart';
import 'package:quest/controllers/RecoveryController.dart';
import 'package:quest/controllers/RightsListController.dart';
import 'package:quest/controllers/WarehouseListCOntroller.dart';
import 'package:quest/controllers/itemDetailsController.dart';
import 'package:quest/controllers/itemDetailsbyIdController.dart';
import 'package:quest/controllers/login_auth.dart';
import 'package:quest/models/ItemDetailedByQRScanModel.dart';
import 'package:quest/models/LedgerDetailsModel.dart';

import '../controllers/CustomerListController.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => CustomerListContoller());
    Get.lazyPut(() => NewController());
    Get.lazyPut(() => QRscanController());
    Get.lazyPut(() => ItemDetailedByQrModel());
    Get.lazyPut(() => ItemColorListController());
    Get.lazyPut(() => ItemDetailsbyIdController());
    Get.lazyPut(() => CashCustomerListContoller());
    Get.lazyPut(() => LegderBalanceController());
    Get.lazyPut(() => LedgerDetailsController());
    Get.lazyPut(() => WarehouseListController());

    Get.lazyPut(() => RightsListController());
    Get.lazyPut(() => RecoveryCOntroller());
  }
}
