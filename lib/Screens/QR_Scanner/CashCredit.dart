import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screens/Customers/cashCustomers.dart';
import 'package:quest/Screens/Customers/searchCustomers.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/Screens/QR_Scanner/QR_Scanner.dart';
import 'package:quest/Screens/QR_Scanner/selectCashCustomer.dart';
import 'package:quest/Screens/QR_Scanner/selectcreditcustomers.dart';
import 'package:quest/Screens/items/searchItems.dart';
import 'package:quest/widgets/roundbutton.dart';

class CashCredit extends StatefulWidget {
  const CashCredit({super.key});

  @override
  State<CashCredit> createState() => _CashCreditState();
}

class _CashCreditState extends State<CashCredit> {
  String cashCustomer = 'CASH';
  String CreditCustomer = 'CREDIT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("CashCredit")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Get.to(() => SearchCustomer());
                  //     },
                  //     child: Text("Customers List")),
                  RoundButton(
                      onPress: () {
                        Get.to(() => selectCreditCustomer(
                              customerType: '${CreditCustomer}',
                            ));
                      },
                      title: 'Credit'),
                  SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                      onPress: () {
                        Get.to(() => SelectCashCustomer(
                              customerType: '${cashCustomer}',
                            ));
                        // Get.to(() => BarCode2());
                      },
                      title: 'Cash'),
                  SizedBox(
                    height: 30,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
