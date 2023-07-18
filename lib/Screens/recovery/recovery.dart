import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:quest/controllers/RecoveryController.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/utils/utils.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/CustomerListController.dart';

class Recovery extends StatefulWidget {
  const Recovery({super.key});

  @override
  State<Recovery> createState() => _RecoveryState();
}

class _RecoveryState extends State<Recovery> {
  TextEditingController remarkscontroller = TextEditingController();
  TextEditingController chequeNocontroller = TextEditingController();
  TextEditingController creditController = TextEditingController();
  String voucherNo = '';
  String voucherType = '';
  String voucherDate =
      DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now().toUtc());
  String insertUpdateDelete = 'Save';

  @override
  void dispose() {
    Get.find<CustomerListContoller>().searchtext.clear();
    super.dispose();
  }

  CustomerListContoller creditcustomercontroller =
      Get.find<CustomerListContoller>();
  RecoveryCOntroller recoveryCOntroller =
      Get.put<RecoveryCOntroller>(RecoveryCOntroller());

  // TextEditingController search = TextEditingController();
  List<Listdata> data = [];
  @override
  Widget build(BuildContext context) {
    // for (int i = 0;
    //     i < creditcustomercontroller.list.customerlistdata!.length;
    //     i++)
    //     {
    //   Get.log(
    //       "Customers : ${creditcustomercontroller.list.customerlistdata![i].name}");
    // }

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Customers List',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: creditcustomercontroller.searchtext,

                  onChanged: (value) async {
                    await creditcustomercontroller.getcustomerlist();
                    data.clear();
                    setState(() {
                      data = creditcustomercontroller.list.customerlistdata!
                          .where((element) => element.name!.contains(RegExp(
                              creditcustomercontroller.searchtext.text,
                              caseSensitive: false)))
                          .toList();
                      Get.log("Data is $data}");
                    });
                  },

                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid)),
                      errorBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                              style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black))),
                  // controller: controller,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                child: SizedBox(
                  height: 600,
                  child: Get.find<CustomerListContoller>()
                          .searchtext
                          .text
                          .isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            var singleData = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Get.log("Index is ${singleData.name}");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      //Text("Item ${index+1}"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Customer Code :${singleData.customerCode}'),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Name  :${singleData.name}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Urdu Name:${singleData.urduName}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              ' City name : ${singleData.cityName}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              ' City Urdu Name : ${singleData.cityUrduName}'),
                                          Text(""),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  String remarks = '';
                                                  String checkNumber = '';
                                                  double amount = 0.0;

                                                  return AlertDialog(
                                                    title:
                                                        Text('Enter Details'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              remarkscontroller,
                                                          onChanged: (value) {
                                                            remarks = value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Remarks'),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              chequeNocontroller,
                                                          onChanged: (value) {
                                                            checkNumber = value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Check Number'),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              creditController,
                                                          onChanged: (value) {
                                                            amount =
                                                                double.tryParse(
                                                                        value) ??
                                                                    0.0;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Amount'),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          if (creditController
                                                                  .text ==
                                                              0) {
                                                            Utils.flushBarErrorMessage(
                                                                'Please Enter Amount',
                                                                context);
                                                          } else {
                                                            recoveryCOntroller.RecoveryAPi(
                                                                insertUpdateDelete:
                                                                    insertUpdateDelete,
                                                                chequeNo:
                                                                    chequeNocontroller
                                                                        .text,
                                                                credit: double.parse(
                                                                    creditController
                                                                        .text),
                                                                detailCode:
                                                                    singleData
                                                                        .customerCode,
                                                                remarks:
                                                                    remarkscontroller
                                                                        .text,
                                                                voucherDate:
                                                                    voucherDate,
                                                                voucherNo:
                                                                    voucherNo,
                                                                voucherType:
                                                                    voucherType);
                                                            // Do something with the entered details
                                                            // For example, print them to the console
                                                            print(
                                                                'Remarks: $remarks');
                                                            print(
                                                                'Check Number: $checkNumber');
                                                            print(
                                                                'Amount: $amount');

                                                            Get.back();
                                                          }
                                                        },
                                                        child: Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.black),
                                              child: Center(
                                                child: Text(
                                                  'Recovery',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.black,
                              thickness: 1,
                              height: 1,
                            );
                          },
                          itemCount: data.length)
                      : ListView.separated(
                          itemCount: creditcustomercontroller
                                  .list.customerlistdata?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var singleData = creditcustomercontroller
                                .list.customerlistdata![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  // Get.log("Index is ${singleData.name}");
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    children: [
                                      //Text("Item ${index+1}"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Customer Code: ${singleData.customerCode}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Customer Name :${singleData.name}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'Urdu Name :${singleData.urduName}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'City name :${singleData.cityName}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              'City Urdu Name :${singleData.cityUrduName}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  String remarks = '';
                                                  String checkNumber = '';
                                                  double amount = 0.0;

                                                  return AlertDialog(
                                                    title:
                                                        Text('Enter Details'),
                                                    content: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        TextField(
                                                          controller:
                                                              remarkscontroller,
                                                          onChanged: (value) {
                                                            remarks = value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Remarks'),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              chequeNocontroller,
                                                          onChanged: (value) {
                                                            checkNumber = value;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Check Number'),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              creditController,
                                                          onChanged: (value) {
                                                            amount =
                                                                double.tryParse(
                                                                        value) ??
                                                                    0.0;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                                  labelText:
                                                                      'Amount'),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          if (creditController
                                                                  .text ==
                                                              0) {
                                                            Utils.flushBarErrorMessage(
                                                                'Please Enter Amount ',
                                                                context);
                                                          } else {
                                                            recoveryCOntroller.RecoveryAPi(
                                                                insertUpdateDelete:
                                                                    insertUpdateDelete,
                                                                chequeNo:
                                                                    chequeNocontroller
                                                                        .text,
                                                                credit: double.parse(
                                                                    creditController
                                                                        .text),
                                                                detailCode:
                                                                    singleData
                                                                        .customerCode,
                                                                remarks:
                                                                    remarkscontroller
                                                                        .text,
                                                                voucherDate:
                                                                    voucherDate,
                                                                voucherNo:
                                                                    voucherNo,
                                                                voucherType:
                                                                    voucherType);
                                                            // Do something with the entered details
                                                            // For example, print them to the console
                                                            print(
                                                                'Remarks: $remarks');
                                                            print(
                                                                'Check Number: $checkNumber');
                                                            print(
                                                                'Amount: $amount');

                                                            Get.back();
                                                          }
                                                        },
                                                        child: Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.black),
                                              child: Center(
                                                child: Text(
                                                  'Recovery',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(color: Colors.black);
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
