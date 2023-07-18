import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screen1.dart';
import 'package:quest/Screens/DashBoard/DB5.dart';
import 'package:quest/Screens/DashBoard/dashboard4.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/Screens/QR_Scanner/QR_Scanner.dart';
import 'package:quest/Screens/login/login2.dart';
import 'package:quest/controllers/RightsListController.dart';
import 'package:quest/temp_splash.dart';
import 'Screens/Customers/searchCustomers.dart';
import 'Screens/items/searchItems.dart';
import 'Screens/login/loginScreen.dart';
import 'bindings/data_binding.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // GetStorage().remove('token');
    Get.log('------TOken is now ${GetStorage().read('token')}');
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button on Android
        if (GetPlatform.isAndroid) {
          
          SystemNavigator.pop();
          return false;
        }
        return true;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GetStorage().read('token') == null ? SiginIn() : SplashScreen(),
        // : Dashboard4(
        //     fullname: GetStorage().read('fullname'),
        //     SalesmanID: GetStorage().read('SalesmanId')),
        initialBinding: DataBindings(),
      ),
    );
  }
}
