// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:quest/Screens/Customers/cashCustomers.dart';
// import 'package:quest/Screens/Customers/searchCustomers.dart';
// import 'package:quest/Screens/QR_Scanner/CashCredit2.dart';
// import 'package:quest/Screens/Warehouse/dropdownexample.dart';

// import 'package:quest/Screens/items/searchItems.dart';
// import 'package:quest/Screens/ledger/SelectLedgerCustomer.dart';
// import 'package:quest/Screens/login/login2.dart';
// import 'package:quest/Screens/login/loginScreen.dart';
// import 'package:quest/Screens/recovery/recovery.dart';
// import 'package:quest/Screens/rightsScreen/rightslist.dart';
// import 'package:quest/controllers/CashCustomerListController.dart';
// import 'package:quest/controllers/CustomerListController.dart';
// import 'package:quest/controllers/ItemController.dart';
// import 'package:quest/controllers/LedgerBalanceController.dart';
// import 'package:quest/controllers/RightsListController.dart';
// import 'package:quest/controllers/WarehouseListCOntroller.dart';

// import '../QR_Scanner/CashCredit.dart';

// class Dashboard4 extends StatefulWidget {
//   final String fullname;
//   final int SalesmanID;
//   const Dashboard4(
//       {super.key, required this.fullname, required this.SalesmanID});

//   @override
//   State<Dashboard4> createState() => _Dashboard4State();
// }

// class _Dashboard4State extends State<Dashboard4> {
//   List<Map<String, dynamic>> menuList = [
//     {"menuName": "CustomerLedger", "userID": 2022, "showMain": 1},
//     {"menuName": "CustomerList", "userID": 2022, "showMain": 1},
//     {"menuName": "ItemsList", "userID": 2022, "showMain": 1},
//     {"menuName": "RateChange", "userID": 2022, "showMain": 1},
//     {"menuName": "Recovery", "userID": 2022, "showMain": 1},
//     {"menuName": "SaleOrder", "userID": 2022, "showMain": 1},
//     {"menuName": "ShopSale", "userID": 2022, "showMain": 1},
//     {"menuName": "StoreTransfer", "userID": 2022, "showMain": 1}
//   ];

//   List<String> visibleMenuItems = [];

//   @override
//   void initState() {
//     Get.find<RightsListController>().getrightslist(id: 2022);
//     filterVisibleMenuItems();
//     Get.find<CustomerListContoller>().getcustomerlist();
//     Get.find<NewController>().newgetItemList();
//     Get.find<CashCustomerListContoller>().getcashCustomerlist();
//     LegderBalanceController ledgerBalancecontroller =
//         Get.find<LegderBalanceController>();
//     WarehouseListController warehouseListController =
//         Get.put<WarehouseListController>(WarehouseListController());
//     RightsListController rightslistcontroller =
//         Get.put<RightsListController>(RightsListController());
//     super.initState();
//   }

//   void filterVisibleMenuItems() {
//     visibleMenuItems = menuList
//         .where((item) => item["menuName"] != null && item["showMain"] == 1)
//         .map((item) => item["menuName"] as String)
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Get.log('I am in Build');
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(50.0),
//                 bottomRight: Radius.circular(50.0),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.black),
//                 height: 170,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 40,
//                       width: double.infinity,
//                       child: Row(
//                         children: [
//                           Expanded(child: SizedBox()),
//                           InkWell(
//                             onTap: () {
//                               GetStorage().remove('token');
//                               Get.to(() => SiginIn());
//                             },
//                             child: Container(
//                               height: 40,
//                               width: 150,
//                               decoration: BoxDecoration(color: Colors.black),
//                               child: Row(children: [
//                                 Text(
//                                   'LOG OUT',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: 'OoohBaby',
//                                       fontSize: 22),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Image.asset('assets/images/logout.jpg'),
//                               ]),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Center(
//                         child: Text(
//                       "ADMIN  DASHBOARD4",
//                       style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     )),
//                     Text(
//                       " ${widget.fullname}",
//                       style: TextStyle(fontSize: 26, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ), // ... Your existing code

//             SizedBox(height: 20),

//             Wrap(
//               alignment: WrapAlignment.spaceEvenly,
//               spacing: 50,
//               runSpacing: 20,
//               children: [
//                 if (visibleMenuItems.contains("SaleOrder"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => CashCredit2());
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 100,
//                               child: Image.asset('assets/images/img1.png')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Text(
//                             "SALES ORDER",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Container for CustomerLedger
//                   ),

//                 if (visibleMenuItems.contains("CustomerList"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await Get.find<CashCustomerListContoller>()
//                                 .getcashCustomerlist();
//                             Get.to(() => SearchCustomer());
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 105,
//                               child: Image.asset('assets/images/img3.png')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: Text(
//                               "CUSTOMERS",
//                               style: TextStyle(
//                                   fontSize: 13, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Container for CustomerList
//                   ),
//                 if (visibleMenuItems.contains("ItemsList"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await Get.find<NewController>().newgetItemList();
//                             Get.to(() => const ItemSearch());
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 105,
//                               child: Image.asset('assets/images/items.png')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Text(
//                             "ITEMS LIST",
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Container for ItemsList
//                   ),

//                 if (visibleMenuItems.contains("CustomerLedger"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Get.to(() => SelectLedgerCustomer());
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 85,
//                               child: Image.asset('assets/images/balance.png')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Text(
//                             "Ledger ",
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Container for ItemsList
//                   ),
//                 if (visibleMenuItems.contains("StoreTransfer"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await Get.find<WarehouseListController>()
//                                 .getWarehouseList();
//                             Get.to(() => Select(
//                                   title: 'WareHouse',
//                                   SalesmanId: GetStorage().read('SalesmanId'),
//                                 ));
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 85,
//                               child:
//                                   Image.asset('assets/images/warehouse.png')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Text(
//                             "Store  ",
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Container for ItemsList
//                   ),

//                 if (visibleMenuItems.contains("ItemsList"))
//                   Container(
//                     width: MediaQuery.of(context).size.width / 3 - 40,
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await Get.find<CashCustomerListContoller>()
//                                 .getcashCustomerlist();
//                             Get.to(() => Recovery());
//                           },
//                           child: Container(
//                               height: 85,
//                               width: 85,
//                               child: Image.asset('assets/images/5.jpg')),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8),
//                           child: Text(
//                             "Recovery ",
//                             style: TextStyle(
//                                 fontSize: 13, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Container for ItemsList
//                   ),
//                 // ... Other containers based on menu items
//               ],
//             ),

//             // ... Your existing code
//           ],
//         ),
//       ),
//     );
//   }
// }
// // 