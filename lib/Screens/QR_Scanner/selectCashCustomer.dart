import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/models/cashCustomerlistModel.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/CustomerListController.dart';

class SelectCashCustomer extends StatefulWidget {
  final String customerType;
  const SelectCashCustomer({super.key, required this.customerType});

  @override
  State<SelectCashCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SelectCashCustomer> {
  TextEditingController _percentagecontroller = TextEditingController();
  CashCustomerListContoller cashcustomercontroller =
      Get.put<CashCustomerListContoller>(CashCustomerListContoller());
  // TextEditingController search = TextEditingController();
  List<CashCustomerListdata> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'CASH CUSTOMERS',
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
                  controller: Get.find<CashCustomerListContoller>().searchtext,
                  onChanged: (value) {
                    cashcustomercontroller.getcashCustomerlist(context);
                    data.clear();
                    setState(() {
                      data = cashcustomercontroller.list.listdata!
                          .where((element) => element.name!.contains(RegExp(
                              Get.find<CashCustomerListContoller>()
                                  .searchtext
                                  .text,
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
                  child: Get.find<CashCustomerListContoller>()
                          .searchtext
                          .text
                          .isNotEmpty
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            var singleData = data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Enter Percentage'),
                                        content: TextField(
                                          controller: _percentagecontroller,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          decoration: InputDecoration(
                                            hintText: 'Enter percentage',
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {
                                              final enteredValue = int.tryParse(
                                                  _percentagecontroller.text
                                                      .trim());

// Check if the entered value is valid
                                              if (_percentagecontroller
                                                      .text.isEmpty ||
                                                  (enteredValue != null &&
                                                      (enteredValue >= 0 &&
                                                          enteredValue <=
                                                              100))) {
                                                // Return the entered value to the calling screen
                                                Get.to(() => ScanManual(
                                                      customerType:
                                                          widget.customerType,
                                                      cityName: '0',
                                                      customerName:
                                                          singleData.name!,
                                                      urduName: '0',
                                                      percentage: enteredValue ??
                                                          0, // Assign a default value of 0 if enteredValue is null
                                                      customerCode: 0,
                                                    ));
                                              } else {
                                                // Show an error message
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Please enter a valid percentage value between 0 and 100.'),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                                              'Customer Name:${singleData.name}'),
                                          Text("abc"),
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
                          itemCount:
                              cashcustomercontroller.list.listdata?.length ?? 0,
                          itemBuilder: (context, index) {
                            var singleData =
                                cashcustomercontroller.list.listdata![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  // Get.log("Index is ${singleData.name}");
                                  await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Enter Percentage'),
                                        content: TextField(
                                          controller: _percentagecontroller,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  decimal: true),
                                          decoration: InputDecoration(
                                            hintText: 'Enter percentage',
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Cancel',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            onPressed: () {
                                              final enteredValue = int.tryParse(
                                                  _percentagecontroller.text
                                                      .trim());

// Check if the entered value is valid
                                              if (_percentagecontroller
                                                      .text.isEmpty ||
                                                  (enteredValue != null &&
                                                      (enteredValue >= 0 &&
                                                          enteredValue <=
                                                              100))) {
                                                // Return the entered value to the calling screen
                                                Get.to(() => ScanManual(
                                                      customerType:
                                                          widget.customerType,
                                                      cityName: '0',
                                                      customerName:
                                                          singleData.name!,
                                                      urduName: '',
                                                      percentage: enteredValue ??
                                                          0, // Assign a default value of 0 if enteredValue is null
                                                      customerCode: 0,
                                                    ));
                                              } else {
                                                // Show an error message
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'Please enter a valid percentage value between 0 and 100.'),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
                                              'Customer Name: ${singleData.name}'),
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
