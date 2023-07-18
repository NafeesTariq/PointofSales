import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/models/cashCustomerlistModel.dart';
import 'package:quest/models/customer_list_model.dart';

import '../../controllers/CustomerListController.dart';

class SearchCashCustomer extends StatefulWidget {
  const SearchCashCustomer({super.key});

  @override
  State<SearchCashCustomer> createState() => _SearchCustomerState();
}

class _SearchCustomerState extends State<SearchCashCustomer> {
  CashCustomerListContoller cashcustomercontroller =
      Get.put<CashCustomerListContoller>(CashCustomerListContoller());
  // TextEditingController search = TextEditingController();
  List<CashCustomerListdata> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Cash Customers List"),
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
                      hintStyle: TextStyle(color: Colors.amber),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.amber,
                              width: 1,
                              style: BorderStyle.solid)),
                      errorBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: Colors.amber,
                              width: 1,
                              style: BorderStyle.solid)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.amber))),
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
                                              'Customer Name:${singleData.name}'),
                                          Text("abc"),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider()
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.amber,
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
                                              'Customer Name: ${singleData.name}'),
                                          Text(""),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider()
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
}
