import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/models/separate_itemlist.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/CustomerListController.dart';

class ItemSearch extends StatefulWidget {
  const ItemSearch({super.key});

  @override
  State<ItemSearch> createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
  // @override
  // void dispose() {
  //   Get.find<NewController>().searchtext.clear();
  //   super.dispose();
  // }

  // CustomerListContoller customercontroller = Get.find<CustomerListContoller>();
  // ItemListController itemcontroller = Get.find<ItemListController>();
  NewController itemcontroller = Get.find<NewController>();
  // TextEditingController search = TextEditingController();

  TextEditingController search = TextEditingController();
  List<Listdatas> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'ITEMS LIST',
          onBackButtonPressed: () {
            Navigator.pop(context);
          }),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: Get.find<NewController>().searchtext,
                  onChanged: (value) {
                    itemcontroller.newgetItemList();
                    data.clear();
                    setState(() {
                      Get.log("Text is ${itemcontroller.searchtext.text}");
                      Get.log("DAta is :${data.length}");
                      data = itemcontroller.list.itemlist!
                          .where((element) => element.itemName!.contains(RegExp(
                              itemcontroller.searchtext.text,
                              caseSensitive: false)))
                          .toList();
                      Get.log("After DAta is :${data.length}");
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
              SizedBox(
                height: 600,
                child: Get.find<NewController>().searchtext.text.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          var singleData = data[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                      Text('Item ID :${singleData.itemID}'),
                                      // Text("abc"),
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
                                          'Brand Name : ${singleData.brandName}'),
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
                                          'Item Name  :${singleData.itemName}'),
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
                                      Text('Urdu Name:${singleData.urduName}'),
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
                                      Text(' Barcode : ${singleData.barcode}'),
                                      Text(""),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //         'Sale Price : ${singleData.salePrice}'),
                                  //     Text(""),
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Category Name : ${singleData.categoryName}'),
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
                        itemCount: itemcontroller.list.itemlist?.length ?? 0,
                        itemBuilder: (context, index) {
                          var singleData = itemcontroller.list.itemlist![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                      Text('Item ID :${singleData.itemID}'),
                                      // Text("abc"),
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
                                          'Brand Name : ${singleData.brandName}'),
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
                                          'Item Name  :${singleData.itemName}'),
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
                                      Text('Urdu Name:${singleData.urduName}'),
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
                                      Text(' Barcode : ${singleData.barcode}'),
                                      Text(""),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Text(
                                  //         'Sale Price : ${singleData.salePrice}'),
                                  //     Text(""),
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Category Name : ${singleData.categoryName}'),
                                      Text(""),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
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
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(color: Colors.black);
                        },
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
