import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/controllers/ItemColorListController.dart';
import 'package:quest/models/Itemcolorlist_Model.dart';
import 'package:quest/models/customer_list_model.dart';

import '../../controllers/CustomerListController.dart';

class ChooseColor extends StatefulWidget {
  const ChooseColor({super.key});

  @override
  State<ChooseColor> createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  final _percentagecontroller = TextEditingController();
  @override
  void dispose() {
    _percentagecontroller.dispose();
    super.dispose();
  }

  CustomerListContoller customercontroller = Get.find<CustomerListContoller>();

  ItemColorListController itemcolorcontroller =
      Get.find<ItemColorListController>();
  // TextEditingController search = TextEditingController();
  List<ItemColorListData> data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Customers List"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     keyboardType: TextInputType.text,
              //     controller: Get.find<CustomerListContoller>().searchtext,
              //     onChanged: (value) {
              //       data.clear();
              //       setState(() {
              //         data = item.list.customerlistdata!
              //             .where((element) => element.name!.contains(RegExp(
              //                 Get.find<CustomerListContoller>().searchtext.text,
              //                 caseSensitive: false)))
              //             .toList();
              //         Get.log("Data is $data}");
              //       });
              //     },
              //     decoration: InputDecoration(
              //         contentPadding: const EdgeInsets.only(left: 10),
              //         hintText: 'Search',
              //         hintStyle: TextStyle(color: Colors.amber),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //                 color: Colors.amber,
              //                 width: 1,
              //                 style: BorderStyle.solid)),
              //         errorBorder: InputBorder.none,
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(
              //                 color: Colors.amber,
              //                 width: 1,
              //                 style: BorderStyle.solid)),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(8),
              //             borderSide: BorderSide(color: Colors.amber))),
              //     // controller: controller,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: Text(
              //     "Please Select Customer",
              //     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              //   ),
              // ),
              InkWell(
                child: SizedBox(
                  height: 600,
                  child: ListView.separated(
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
                                      Text('Color Id :${singleData.colorId}'),
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
                                          'Color Name :${singleData.colorName}'),
                                      Text(""),
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
                      itemCount: data.length),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
