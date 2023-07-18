import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screens/DashBoard/DB5.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/controllers/CustomerListController.dart';
import 'package:quest/controllers/RightsListController.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RightsListController _rightsListController =
      Get.put<RightsListController>(RightsListController());
  CustomerListContoller customerListContoller =
      Get.put<CustomerListContoller>(CustomerListContoller());
  CashCustomerListContoller cashCustomerListContoller =
      Get.put<CashCustomerListContoller>(CashCustomerListContoller());

  bool isLoading = true;
  getCashAndCredit() async {
    await customerListContoller.getcustomerlist();
    await cashCustomerListContoller.getcashCustomerlist(context);
    await _rightsListController.getrightslist(
        id: GetStorage().read('SalesmanId'));
    Get.log(
        '----length of credit customers in splash= ${customerListContoller.customerlist!.customerlistdata!.length}');
    Get.log(
        '----length of cash customers in splash= ${cashCustomerListContoller.customerlist!.listdata!.length}');
    Get.log(
        '----length of rights list  in splash= ${_rightsListController.list!.listdata!.length}');
  }

  @override
  void initState() {
    getCashAndCredit();

    navigateToDashboard();
    super.initState();
  }

  void navigateToDashboard() async {
    final String fullname = GetStorage().read('fullname');
    final int salesmanID = GetStorage().read('SalesmanId');

    // _rightsListController.getrightslist(id: salesmanID);

    // customerListContoller.getcustomerlist();

    // Simulate a delay to showcase the circular progress indicator
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    Timer(Duration(seconds: 2), () {
      // customerListContoller.getcustomerlist();
      Get.to(() => Dashboard4(fullname: fullname, SalesmanID: salesmanID));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset('assets/images/launcher_icon.png'),
      ),
    );
  }
}
