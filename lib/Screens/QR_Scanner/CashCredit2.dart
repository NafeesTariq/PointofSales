import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quest/Screens/Customers/cashCustomers.dart';
import 'package:quest/Screens/QR_Scanner/selectCashCustomer.dart';
import 'package:quest/Screens/QR_Scanner/selectcreditcustomers.dart';
import 'package:quest/Screens/items/searchItems.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../QR_Scanner/CashCredit.dart';

class CashCredit2 extends StatefulWidget {
  const CashCredit2({super.key});

  @override
  State<CashCredit2> createState() => _CashCredit2State();
}

class _CashCredit2State extends State<CashCredit2> {
  String cashCustomer = 'CASH';
  String CreditCustomer = 'CREDIT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Customer Type',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(children: [
        Container(
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1)),
                  height: 250,
                  width: 250,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => selectCreditCustomer(
                                customerType: '${CreditCustomer}',
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Image.asset('assets/images/loan.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "CREDIT   CUSTOMER",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black, width: 1)),
                  height: 250,
                  width: 250,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => SelectCashCustomer(
                                customerType: '${cashCustomer}',
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Image.asset('assets/images/cash.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "CASH   CUSTOMER",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
