import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/Screens/ledger/LedgerDetailsTable.dart';
import 'package:quest/Screens/ledger/datedialogue.dart';
import 'package:quest/Screens/ledger/tab2.dart';
import 'package:quest/controllers/LedgerBalanceController.dart';
import 'package:quest/controllers/itemDetailsController.dart';
import 'package:quest/models/LedgerBalanceModel.dart';
import 'package:quest/models/LedgerDetailsModel.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/CustomerListController.dart';

class SelectLedgerCustomer extends StatefulWidget {
  const SelectLedgerCustomer({super.key});

  @override
  State<SelectLedgerCustomer> createState() => _SelectLedgerCustomerState();
}

class _SelectLedgerCustomerState extends State<SelectLedgerCustomer> {
  final _percentagecontroller = TextEditingController();
  @override
  void dispose() {
    _percentagecontroller.dispose();
    super.dispose();
  }

  CustomerListContoller customercontroller = Get.find<CustomerListContoller>();

  LegderBalanceController ledgerBalancecontroller =
      Get.find<LegderBalanceController>();
  LedgerDetailsController ledgerDetailscontroller =
      Get.put<LedgerDetailsController>(LedgerDetailsController());

  // TextEditingController search = TextEditingController();
  List<Listdata> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ledger Details'),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: Get.find<CustomerListContoller>().searchtext,
                  onChanged: (value) {
                    customercontroller.getcustomerlist();
                    data.clear();
                    setState(() {
                      data = customercontroller.list.customerlistdata!
                          .where((element) => element.name!.contains(RegExp(
                              Get.find<CustomerListContoller>().searchtext.text,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Please Select Customer",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
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
                                onTap: () {},
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
                                          Text("abc"),
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
                                              ' City Urdu Name : ${singleData.cityUrduName}}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              //rr1
                                              
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border:
                                                      Border.all(width: 0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "Balance",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border:
                                                      Border.all(width: 0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "Details",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(),
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
                            return Divider(
                              color: Colors.black,
                              thickness: 1,
                              height: 1,
                            );
                          },
                          itemCount: data.length)
                      : ListView.separated(
                          itemCount: customercontroller
                                  .list.customerlistdata?.length ??
                              0,
                          itemBuilder: (context, index) {
                            var singleData = customercontroller
                                .list.customerlistdata![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {},
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
                                      //rrrr
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Customer  Balance '),
                                                    content: Text(
                                                        'Balance is ${ledgerBalancecontroller.balance.balance}'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text('Cancel'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      TextButton(
                                                        child: Text('OK'),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: InkWell(
                                              onTap: () async {
                                                //abc
                                                await ledgerBalancecontroller
                                                    .GetLedgerBalance(
                                                        detailedCode: double
                                                            .parse(singleData
                                                                .customerCode
                                                                .toString()));

                                                print(
                                                    "customer passed  : ${singleData.customerCode}");
                                                Get.log(
                                                    "My Balance is ${ledgerBalancecontroller.balance.balance!}");
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Enter Percentage'),
                                                      content: Text(
                                                          "Balance is ${ledgerBalancecontroller.balance.balance!}"),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Cancel'),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Text('OK'),
                                                          onPressed: () {
                                                            final enteredValue =
                                                                int.tryParse(
                                                                    _percentagecontroller
                                                                        .text
                                                                        .trim());

// Check if the entered value is valid
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 110,
                                                decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    border:
                                                        Border.all(width: 0.25),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                    child: Text(
                                                  "Balance",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              Map<String, dynamic>? result =
                                                  await showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return DateRangeDialog();
                                                },
                                              );

                                              if (result != null) {
                                                String fromDate =
                                                    result['fromDate'];
                                                String toDate =
                                                    result['toDate'];

                                                DateTime fromDateTime =
                                                    DateTime.parse(fromDate);
                                                DateTime toDateTime =
                                                    DateTime.parse(toDate);

                                                if (fromDateTime
                                                    .isBefore(toDateTime)) {
                                                  Get.log(
                                                      "Code is: ${double.parse(singleData.customerCode.toString())}  From Date is ${fromDate}   to Date is ${toDate}");

                                                  await ledgerDetailscontroller
                                                      .getledgerDetails(
                                                          detailedCode: double
                                                              .parse(singleData
                                                                  .customerCode
                                                                  .toString()),
                                                          fromDate: fromDate,
                                                          todate: toDate);

                                                  var ledgerdata =
                                                      ledgerDetailscontroller!
                                                          .ledgerdetailslist!
                                                          .list;
                                                  Get.to(() =>
                                                      TabularDataScreen(
                                                          data: ledgerdata));
                                                  // Get.to(() =>
                                                  //     TabularDataScreen(data: [],));
                                                  // Get.to(LedgerDetailsTable());
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            'Invalid Date Range'),
                                                        content: Text(
                                                            'Please select a valid date range.'),
                                                        actions: [
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text('OK'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              }
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  border:
                                                      Border.all(width: 0.25),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Center(
                                                  child: Text(
                                                "Details",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 2,
                                      ),

                                      // const Divider()
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(color: Colors.amber);
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

  void showPercentageDialog() {}
}
