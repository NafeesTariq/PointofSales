import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:quest/Loca_Services/CheckInternet.dart';
import 'package:quest/Screens/DashBoard/DB5.dart';
import 'package:quest/Screens/DashBoard/dashboard4.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/controllers/CustomerListController.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/RightsListController.dart';
import 'package:quest/temp_splash.dart';
import 'package:quest/utils/loaders.dart';
import 'package:quest/utils/utils.dart';

import '../APis/api_providers.dart';

import '../Screens/Customers/searchCustomers.dart';
import '../Screens/items/searchItems.dart';

class LoginController extends GetxController {
  Api_Provider api_provider = Api_Provider();
  CheckInternet checkInternet = CheckInternet();

  login(String username, String password, BuildContext context) async {
    //loader
    //if(internet)
    // openLoader();

    var internet = await checkInternet.checkInternetConnection();

    print("${internet}");
    if (!internet) {
      // Get.back();
      Utils.flushBarErrorMessage('No internet Connection', context);
    } else {
      api_provider
          .loginAPI(
        username: username,
        password: password,
      )
          .then((value) async {
        if (value!.status == "Active") {
          Get.log("Token is : ${value.token}");
          Get.log('SAlesMan ID is ${value.salesmanID}');
          GetStorage().write('token', value.token);
          GetStorage().write('fullname', value.fullName);
          GetStorage().write('SalesmanId', value.salesmanID);
          Get.log('Read token is ${GetStorage().read('token')}');
          Get.back();
          print('value statis is ${value.status}');
          // Get.find<RightsListController>().getMenuList(id: value.salesmanID);
          update();
          Get.to(() => SplashScreen());
          // Get.to(() => Dashboard4(
          //       SalesmanID: int.parse(value.salesmanID.toString()),
          //       fullname: value.fullName.toString(),
          //     ));
        }
      }).onError((error, stackTrace) {
        print("login error -----${error}-------");
        Get.back();
      });
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
