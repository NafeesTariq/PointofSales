// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:quest/Screens/DashBoard/dashboard.dart';
// import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
// import 'package:quest/Screens/QR_Scanner/chooseColor.dart';
// import 'package:quest/controllers/ItemColorListController.dart';
// import 'package:quest/controllers/ItemController.dart';
// import 'package:quest/controllers/QRScanController.dart';
// import 'package:quest/controllers/itemDetailsbyIdController.dart';
// import 'package:quest/models/customer_list_model.dart';
// import 'package:quest/models/separate_itemlist.dart';

// import '../../controllers/CustomerListController.dart';

// class SelectManualItems extends StatefulWidget {
//   final double percentage;
//   final String customerName;
//   String colornamevalue = '';
//   String colorId = '';
//   String ColorName = '';
//   int ColorId = 0;
//   TextEditingController quantityController = TextEditingController();

//   SelectManualItems(
//       {super.key, required this.percentage, required this.customerName});

//   @override
//   State<SelectManualItems> createState() => _SelectManualItemsState();
// }

// class _SelectManualItemsState extends State<SelectManualItems> {
//   // CustomerListContoller customercontroller = Get.find<CustomerListContoller>();
//   // ItemListController itemcontroller = Get.find<ItemListController>();

//   ItemColorListController itemcolorcontroller =
//       Get.find<ItemColorListController>();
//   ItemDetailsbyIdController itemDetailsbyIdController =
//       Get.find<ItemDetailsbyIdController>();

//   // TextEditingController search = TextEditingController();
//   QRscanController qRscanController = Get.find<QRscanController>();
//   List<Listdatas> data = [];

//   @override
//   Widget build(BuildContext context) {
//     NewController itemcontroller = Get.put(NewController());
//     print("Percentage : ${widget.percentage}");
//     print("CustomerName : ${widget.customerName}");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(" Item List"),
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.text,
//                   controller: Get.find<NewController>().searchtext,
//                   onChanged: (value) {
//                     itemcontroller.newgetItemList();
//                     data.clear();
//                     setState(() {
//                       data = itemcontroller.list.itemlist!
//                           .where((element) => element.itemName!.contains(RegExp(
//                               Get.find<NewController>().searchtext.text,
//                               caseSensitive: false)))
//                           .toList();
//                       Get.log("Data is $data}");
//                     });
//                   },
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(left: 10),
//                       hintText: 'Search',
//                       hintStyle: TextStyle(color: Colors.amber),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(
//                               color: Colors.amber,
//                               width: 1,
//                               style: BorderStyle.solid)),
//                       errorBorder: InputBorder.none,
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(
//                               color: Colors.amber,
//                               width: 1,
//                               style: BorderStyle.solid)),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide(color: Colors.amber))),
//                   // controller: controller,
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 600,
//                 child: Get.find<NewController>().searchtext.text.isNotEmpty
//                     ? ListView.separated(
//                         itemBuilder: (context, index) {
//                           var singleData = data[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InkWell(
//                               onTap: () async {
//                                 await itemDetailsbyIdController.getitemdetails(
//                                     id: singleData.itemID!);
//                                 //without search
//                                 print("Item Id tapped ${singleData.itemID}");
//                                 await itemcolorcontroller
//                                     .getItemColorList(id: singleData.itemID!)
//                                     .then((value) {
//                                   //ifffffffff
//                                   if (itemcolorcontroller
//                                       .itemColorList!.listdata!.isEmpty) {
//                                     final String colorName = '0';
//                                     final String colorUrduName = '0';
//                                     // double saleprices = double.parse(
//                                     //     singleData.salePrice.toString());

//                                     // double newPrice = saleprices +
//                                     //     (widget.percentage / 100) * saleprices;
//                                     // print("NewPrice: ${newPrice}");
//                                     AwesomeDialog(
//                                       context: context,
//                                       animType: AnimType.scale,
//                                       dialogType: DialogType.info,
//                                       body: SizedBox(
//                                         height: 520,
//                                         child: ListView.builder(
//                                           itemCount: 1,
//                                           itemBuilder: (context, index) {
//                                             return Column(
//                                               children: [
//                                                 Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Customer Name :${widget.customerName} ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 '${singleData.itemName} ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 ' ${singleData.urduName}  ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Color Name : ${colorName} ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Color Urdu Name : ${colorUrduName}',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 15),
//                                                       child: Row(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Center(
//                                                             child: Row(
//                                                               children: [
//                                                                 ElevatedButton(
//                                                                     onPressed:
//                                                                         () {
//                                                                       // //ontap additem
//                                                                       // double
//                                                                       //     quantity =
//                                                                       //     double.parse(quantitycontroller
//                                                                       //         .text
//                                                                       //         .toString());

//                                                                       // print(
//                                                                       //     "New SalePrice:${newPrice}");
//                                                                       // double d =
//                                                                       //     saleprice *
//                                                                       //         quantity;
//                                                                       // controller
//                                                                       //         .count
//                                                                       //         .value =
//                                                                       //     saleprice *
//                                                                       //         quantity;

//                                                                       // controller
//                                                                       //     .update();
//                                                                       // controller
//                                                                       //     .list1 = [
//                                                                       //   {
//                                                                       //     'itemID': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .itemId,
//                                                                       //     'itemName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .itemName,
//                                                                       //     'urduName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .urduName,
//                                                                       //     'colorName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .colorName,
//                                                                       //     'colorID': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .colorId,
//                                                                       //     'salePrice':
//                                                                       //         newPrice,
//                                                                       //     'qty': quantitycontroller
//                                                                       //         .text,
//                                                                       //     'grossValue':
//                                                                       //         quantity *
//                                                                       //             newPrice,
//                                                                       //   }
//                                                                       // ];
//                                                                       // print(
//                                                                       //     "List 1 =${controller.list1}");

//                                                                       // // List<dynamic>
//                                                                       // //     storedData =
//                                                                       // //     GetStorage().read(
//                                                                       // //             "myKey") ??
//                                                                       // //         [];
//                                                                       // // List<
//                                                                       // //         Map<String,
//                                                                       // //             dynamic>>
//                                                                       // //     mappedData =
//                                                                       // //     List<Map<String, dynamic>>.from(
//                                                                       // //         storedData);
//                                                                       // // print(
//                                                                       // //     "Stored data : ${mappedData}");
//                                                                       // // list2.addAll(
//                                                                       // //     mappedData);
//                                                                       // // print(
//                                                                       // //     "list 2 after adding previous  : ${list2.length}");
//                                                                       // list2.addAll(
//                                                                       //     controller
//                                                                       //         .list1);
//                                                                       // print(
//                                                                       //     "List 2 after adding list1 =${list2.length} ");
//                                                                       // print(
//                                                                       //     "List 2 after adding list1 =${list2} ");
//                                                                       // GetStorage()
//                                                                       //     .write(
//                                                                       //         'myKey',
//                                                                       //         list2);

//                                                                       // Get.log(
//                                                                       //     " DAta in GetStorage  ${GetStorage().read('myKey')}");

//                                                                       // controller
//                                                                       //     .list1
//                                                                       //     .clear();
//                                                                       // // storedData
//                                                                       // //     .clear();
//                                                                       // // mappedData
//                                                                       // //     .clear();
//                                                                       // controller
//                                                                       //     .update();

//                                                                       // // controller.list1
//                                                                       // //     .clear();

//                                                                       Navigator.of(
//                                                                               context)
//                                                                           .pop();
//                                                                     },
//                                                                     child: Text(
//                                                                         "Add Item")),
//                                                                 SizedBox(
//                                                                   width: 20,
//                                                                 ),
//                                                                 ElevatedButton(
//                                                                     onPressed:
//                                                                         () {
//                                                                       Navigator.of(
//                                                                               context)
//                                                                           .pop();
//                                                                     },
//                                                                     child: Text(
//                                                                         "Cancel")),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 20,
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       title: 'This is Ignored',
//                                       desc: 'This is also Ignored',
//                                     ).show();
//                                   } else {
//                                     //elseeeee
//                                     //without else
//                                     print("Colour Found");
//                                     print(itemcolorcontroller
//                                         .itemColorList!.listdata!.length);
//                                     //choosing color
//                                     showCustomBottomSheet(
//                                         context: context,
//                                         ItemId: singleData.itemID.toString(),
//                                         ItemName: singleData.itemName!,
//                                         urduName: singleData.urduName!);
//                                   }
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5)),
//                                 child: Column(
//                                   children: [
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                             'Item Name  :${singleData.itemName}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                             'Urdu Name:${singleData.urduName}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text('ItemId :${singleData.itemID}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         ' Barcode : ${singleData.barcode}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         'Sale Price : ${singleData.salePrice}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         'Category Name : ${singleData.categoryName}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),

//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Center(),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     const Divider()
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider(
//                             color: Colors.amber,
//                             thickness: 1,
//                             height: 1,
//                           );
//                         },
//                         itemCount: data.length)
//                     : ListView.separated(
//                         itemCount: itemcontroller.list.itemlist?.length ?? 0,
//                         itemBuilder: (context, index) {
//                           var singleData = itemcontroller.list.itemlist![index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: InkWell(
//                               onTap: () async {
//                                 //searched
//                                 print("${singleData.itemID}");
//                                 await itemcolorcontroller
//                                     .getItemColorList(id: singleData.itemID!)
//                                     .then((value) {
//                                   if (itemcolorcontroller
//                                       .itemColorList!.listdata!.isEmpty) {
//                                     final String colorName = '';
//                                     final String colorUrduName = '';
//                                     // double saleprices = double.parse(
//                                     //     singleData.salePrice.toString());

//                                     // double newPrice = saleprices +
//                                     //     (widget.percentage / 100) * saleprices;
//                                     // print("NewPrice: ${newPrice}");
//                                     AwesomeDialog(
//                                       context: context,
//                                       animType: AnimType.scale,
//                                       dialogType: DialogType.info,
//                                       body: SizedBox(
//                                         height: 520,
//                                         child: ListView.builder(
//                                           itemCount: 1,
//                                           itemBuilder: (context, index) {
//                                             return Column(
//                                               children: [
//                                                 Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 '${singleData.itemName} ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 ' ${singleData.urduName}  ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Color Name : ${colorName} ',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 10),
//                                                       child: Container(
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           color: Colors.amber,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(10),
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors.grey
//                                                                   .withOpacity(
//                                                                       0.5),
//                                                               spreadRadius: 2,
//                                                               blurRadius: 5,
//                                                               offset:
//                                                                   Offset(0, 3),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(15.0),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 'Color Urdu Name : ${colorUrduName}',
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 15),
//                                                       child: Row(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .center,
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Center(
//                                                             child: Row(
//                                                               children: [
//                                                                 ElevatedButton(
//                                                                     onPressed:
//                                                                         () {
//                                                                       // //ontap additem
//                                                                       // double
//                                                                       //     quantity =
//                                                                       //     double.parse(quantitycontroller
//                                                                       //         .text
//                                                                       //         .toString());

//                                                                       // print(
//                                                                       //     "New SalePrice:${newPrice}");
//                                                                       // double d =
//                                                                       //     saleprice *
//                                                                       //         quantity;
//                                                                       // controller
//                                                                       //         .count
//                                                                       //         .value =
//                                                                       //     saleprice *
//                                                                       //         quantity;

//                                                                       // controller
//                                                                       //     .update();
//                                                                       // controller
//                                                                       //     .list1 = [
//                                                                       //   {
//                                                                       //     'itemID': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .itemId,
//                                                                       //     'itemName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .itemName,
//                                                                       //     'urduName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .urduName,
//                                                                       //     'colorName': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .colorName,
//                                                                       //     'colorID': qRscanController
//                                                                       //         .itemDetailedByQrModel!
//                                                                       //         .data!
//                                                                       //         .colorId,
//                                                                       //     'salePrice':
//                                                                       //         newPrice,
//                                                                       //     'qty': quantitycontroller
//                                                                       //         .text,
//                                                                       //     'grossValue':
//                                                                       //         quantity *
//                                                                       //             newPrice,
//                                                                       //   }
//                                                                       // ];
//                                                                       // print(
//                                                                       //     "List 1 =${controller.list1}");

//                                                                       // // List<dynamic>
//                                                                       // //     storedData =
//                                                                       // //     GetStorage().read(
//                                                                       // //             "myKey") ??
//                                                                       // //         [];
//                                                                       // // List<
//                                                                       // //         Map<String,
//                                                                       // //             dynamic>>
//                                                                       // //     mappedData =
//                                                                       // //     List<Map<String, dynamic>>.from(
//                                                                       // //         storedData);
//                                                                       // // print(
//                                                                       // //     "Stored data : ${mappedData}");
//                                                                       // // list2.addAll(
//                                                                       // //     mappedData);
//                                                                       // // print(
//                                                                       // //     "list 2 after adding previous  : ${list2.length}");
//                                                                       // list2.addAll(
//                                                                       //     controller
//                                                                       //         .list1);
//                                                                       // print(
//                                                                       //     "List 2 after adding list1 =${list2.length} ");
//                                                                       // print(
//                                                                       //     "List 2 after adding list1 =${list2} ");
//                                                                       // GetStorage()
//                                                                       //     .write(
//                                                                       //         'myKey',
//                                                                       //         list2);

//                                                                       // Get.log(
//                                                                       //     " DAta in GetStorage  ${GetStorage().read('myKey')}");

//                                                                       // controller
//                                                                       //     .list1
//                                                                       //     .clear();
//                                                                       // // storedData
//                                                                       // //     .clear();
//                                                                       // // mappedData
//                                                                       // //     .clear();
//                                                                       // controller
//                                                                       //     .update();

//                                                                       // // controller.list1
//                                                                       // //     .clear();

//                                                                       Navigator.of(
//                                                                               context)
//                                                                           .pop();
//                                                                     },
//                                                                     child: Text(
//                                                                         "Add Item")),
//                                                                 SizedBox(
//                                                                   width: 20,
//                                                                 ),
//                                                                 ElevatedButton(
//                                                                     onPressed:
//                                                                         () {
//                                                                       Navigator.of(
//                                                                               context)
//                                                                           .pop();
//                                                                     },
//                                                                     child: Text(
//                                                                         "Cancel")),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 20,
//                                                 ),
//                                               ],
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       title: 'This is Ignored',
//                                       desc: 'This is also Ignored',
//                                     ).show();
//                                   } else {
//                                     print(itemcolorcontroller
//                                         .itemColorList!.listdata);
//                                     print(itemcolorcontroller.itemColorList!
//                                         .listdata![index].colorName);
//                                     print("Colour Found");
//                                     print(itemcolorcontroller
//                                         .itemColorList!.listdata!.length);
//                                     //choosing color
//                                     showCustomBottomSheet(
//                                         context: context,
//                                         ItemId: singleData.itemID.toString(),
//                                         ItemName: singleData.itemName!,
//                                         urduName: singleData.urduName!);
//                                   }
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5)),
//                                 child: Column(
//                                   children: [
//                                     //Text("Item ${index+1}"),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text('Item ID :${singleData.itemID}'),
//                                     //     // Text("abc"),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         'Brand Name : ${singleData.brandName}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                             'Item Name  :${singleData.itemName}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                             'Urdu Name:${singleData.urduName}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),

//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text('Urdu Name:${singleData.itemID}'),
//                                         Text(""),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),

//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         ' Barcode : ${singleData.barcode}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         'Sale Price : ${singleData.salePrice}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),
//                                     // Row(
//                                     //   mainAxisAlignment:
//                                     //       MainAxisAlignment.spaceBetween,
//                                     //   children: [
//                                     //     Text(
//                                     //         'Category Name : ${singleData.categoryName}'),
//                                     //     Text(""),
//                                     //   ],
//                                     // ),
//                                     // const SizedBox(
//                                     //   height: 5,
//                                     // ),

//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     const SizedBox(
//                                       height: 5,
//                                     ),
//                                     const Divider()
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         separatorBuilder: (context, index) {
//                           return Divider(color: Colors.amber);
//                         },
//                       ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void showCustomDialogAfterColor(BuildContext context, String colornamevalue) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Tapped Value'),
//           content: Column(children: [
//             Text("Item Id "),
//             Text(colornamevalue),
//           ]),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

// //final dialogue
//   void showCustomBottomSheet({
//     required BuildContext context,
//     required String ItemId,
//     required String ItemName,
//     required String urduName,
//   }) {
//     showModalBottomSheet(
//       context: context,

//       isScrollControlled: true, // Allow the bottom sheet to expand vertically
//       builder: (BuildContext context) {
//         Get.log(
//             "Item Id :${ItemId} ItemName :${ItemName}  UrduName : ${urduName}");
//         Get.log(
//             "Sale Price : ${itemDetailsbyIdController.list.data!.salePrice}");
//         return Container(
//           padding: EdgeInsets.all(16),
//           height: MediaQuery.of(context).size.height *
//               0.8, // Set the desired height
//           child: ListView.builder(
//             itemCount: itemcolorcontroller.list.listdata!.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   //colorname
//                   widget.colornamevalue =
//                       itemcolorcontroller.list.listdata![index].colorName!;
//                   widget.ColorId =
//                       itemcolorcontroller.list.listdata![index].colorId!;
//                   print("tap value${widget.colornamevalue}");
//                   double saleprice = double.parse(itemDetailsbyIdController
//                       .list.data!.salePrice
//                       .toString());
//                   Get.log("Sale Price after parsing :${saleprice}");
//                   double newPrice =
//                       saleprice + (widget.percentage / 100) * saleprice;
//                   print("New Price =${newPrice}");

//                   AwesomeDialog(
//                     context: context,
//                     animType: AnimType.scale,
//                     dialogType: DialogType.info,
//                     body: SizedBox(
//                       height: 520,
//                       child: ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: (context, index) {
//                           TextEditingController quantityController =
//                               TextEditingController();
//                           return Column(
//                             children: [
//                               Column(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Customer Name :${widget.customerName} ',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Item ID ${ItemId} ',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Item  Name : ${ItemName}',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'urduName :${urduName}',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Color  Name : ${widget.colornamevalue}',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Color  Id : ${widget.ColorId}',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(10),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(15.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               'Sale Price  : ${newPrice}',
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.w600),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Container(
//                                       width: MediaQuery.of(context).size.width,
//                                       decoration: BoxDecoration(
//                                         color: Colors.amber,
//                                         borderRadius: BorderRadius.circular(5),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: Colors.grey.withOpacity(0.5),
//                                             spreadRadius: 2,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                       ),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(2.0),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             TextFormField(
//                                               onChanged: (value) {
//                                                 // controller.update();
//                                               },
//                                               controller: quantityController,
//                                               decoration: InputDecoration(
//                                                 labelText: 'Enter Quantity',
//                                                 border: OutlineInputBorder(),
//                                                 prefixIcon: Icon(Icons.person),
//                                                 suffixIcon: IconButton(
//                                                   icon: Icon(Icons.clear),
//                                                   onPressed: () {},
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 15),
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Center(
//                                           child: Row(
//                                             children: [
//                                               ElevatedButton(
//                                                   onPressed: () {
//                                                     //final ontap
//                                                     double quantity =
//                                                         double.parse(
//                                                             quantityController
//                                                                 .text
//                                                                 .toString());
//                                                     double grossValue =
//                                                         newPrice * quantity;
//                                                     Get.log(
//                                                         "Customer :${widget.customerName} ItemId:${ItemId}  ItemName:${ItemName}  urduname${urduName} ColorId${widget.ColorId}  ColorName${widget.ColorName} quantity : ${quantity} SalePrice :${newPrice} GrossValue ${grossValue} ");

//                                                     print(
//                                                         "Gross Value =${grossValue}");
//                                                     qRscanController.list1 = [
//                                                       {
//                                                         'CustomerName':
//                                                             widget.customerName,
//                                                         'itemID': ItemId,
//                                                         'itemName': ItemName,
//                                                         'urduName': urduName,
//                                                         'colorName':
//                                                             widget.ColorName,
//                                                         'colorID':
//                                                             widget.ColorId,
//                                                         'qty':
//                                                             quantityController
//                                                                 .text
//                                                                 .toString(),
//                                                         'salePrice': newPrice,
//                                                         'qty':
//                                                             quantityController
//                                                                 .text
//                                                                 .toString(),
//                                                         'grossValue':
//                                                             grossValue,
//                                                       }
//                                                     ];

//                                                     // print(
//                                                     //     "New SalePrice:${newPrice}");
//                                                     // double d =
//                                                     //     saleprice *
//                                                     //         quantity;
//                                                     // controller
//                                                     //         .count
//                                                     //         .value =
//                                                     //     saleprice *
//                                                     //         quantity;

//                                                     // controller
//                                                     //     .update();
//                                                     // controller
//                                                     //     .list1 = [
//                                                     //   {
//                                                     //     'itemID': qRscanController
//                                                     //         .itemDetailedByQrModel!
//                                                     //         .data!
//                                                     //         .itemId,
//                                                     //     'itemName': qRscanController
//                                                     //         .itemDetailedByQrModel!
//                                                     //         .data!
//                                                     //         .itemName,
//                                                     //     'urduName': qRscanController
//                                                     //         .itemDetailedByQrModel!
//                                                     //         .data!
//                                                     //         .urduName,
//                                                     //     'colorName': qRscanController
//                                                     //         .itemDetailedByQrModel!
//                                                     //         .data!
//                                                     //         .colorName,
//                                                     //     'colorID': qRscanController
//                                                     //         .itemDetailedByQrModel!
//                                                     //         .data!
//                                                     //         .colorId,
//                                                     //     'salePrice':
//                                                     //         newPrice,
//                                                     //     'qty': quantitycontroller
//                                                     //         .text,
//                                                     //     'grossValue':
//                                                     //         quantity *
//                                                     //             newPrice,
//                                                     //   }
//                                                     // ];
//                                                     // print(
//                                                     //     "List 1 =${controller.list1}");

//                                                     // // List<dynamic>
//                                                     // //     storedData =
//                                                     // //     GetStorage().read(
//                                                     // //             "myKey") ??
//                                                     // //         [];
//                                                     // // List<
//                                                     // //         Map<String,
//                                                     // //             dynamic>>
//                                                     // //     mappedData =
//                                                     // //     List<Map<String, dynamic>>.from(
//                                                     // //         storedData);
//                                                     // // print(
//                                                     // //     "Stored data : ${mappedData}");
//                                                     // // list2.addAll(
//                                                     // //     mappedData);
//                                                     // // print(
//                                                     // //     "list 2 after adding previous  : ${list2.length}");
//                                                     // list2.addAll(
//                                                     //     controller
//                                                     //         .list1);
//                                                     // print(
//                                                     //     "List 2 after adding list1 =${list2.length} ");
//                                                     // print(
//                                                     //     "List 2 after adding list1 =${list2} ");
//                                                     // GetStorage()
//                                                     //     .write(
//                                                     //         'myKey',
//                                                     //         list2);

//                                                     // Get.log(
//                                                     //     " DAta in GetStorage  ${GetStorage().read('myKey')}");

//                                                     // controller
//                                                     //     .list1
//                                                     //     .clear();
//                                                     // // storedData
//                                                     // //     .clear();
//                                                     // // mappedData
//                                                     // //     .clear();
//                                                     // controller
//                                                     //     .update();

//                                                     // // controller.list1
//                                                     // //     .clear();

//                                                     Navigator.of(context).pop();
//                                                   },
//                                                   child: Text("Add Item")),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               ElevatedButton(
//                                                   onPressed: () {
//                                                     Navigator.of(context).pop();
//                                                   },
//                                                   child: Text("Cancel")),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     title: 'This is Ignored',
//                     desc: 'This is also Ignored',
//                   ).show();
//                 },
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 5),
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 3),
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     '${itemcolorcontroller.list.listdata![index].colorName} ',
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 4,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
