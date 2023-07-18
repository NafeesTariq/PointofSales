import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/Loca_Services/CheckInternet.dart';
import 'package:quest/Screens/Customers/cashCustomers.dart';
import 'package:quest/Screens/Customers/searchCustomers.dart';
import 'package:quest/Screens/QR_Scanner/CashCredit2.dart';
import 'package:quest/Screens/Warehouse/dropdownexample.dart';
import 'package:quest/Screens/items/searchItems.dart';
import 'package:quest/Screens/ledger/SelectLedgerCustomer.dart';
import 'package:quest/Screens/login/login2.dart';
import 'package:quest/Screens/login/loginScreen.dart';
import 'package:quest/Screens/recovery/recovery.dart';
import 'package:quest/Screens/rightsScreen/rightslist.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/controllers/CustomerListController.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/LedgerBalanceController.dart';
import 'package:quest/controllers/RightsListController.dart';
import 'package:quest/controllers/WarehouseListCOntroller.dart';
import 'package:quest/models/RightsListModel.dart';
import 'package:quest/utils/utils.dart';

import '../QR_Scanner/CashCredit.dart';

class Dashboard4 extends StatefulWidget {
  final String fullname;
  final int SalesmanID;
  const Dashboard4(
      {super.key, required this.fullname, required this.SalesmanID});

  @override
  State<Dashboard4> createState() => _Dashboard4State();
}

class _Dashboard4State extends State<Dashboard4> {
  Api_Provider api_provider = Api_Provider();
  CustomerListContoller customerListController =
      Get.put<CustomerListContoller>(CustomerListContoller());
  NewController newController = Get.put<NewController>(NewController());
  CashCustomerListContoller cashCustomerListController =
      Get.put<CashCustomerListContoller>(CashCustomerListContoller());
  LegderBalanceController ledgerBalancecontroller =
      Get.put<LegderBalanceController>(LegderBalanceController());
  WarehouseListController warehouseListController =
      Get.put<WarehouseListController>(WarehouseListController());
  RightsListController rightslistcontroller = Get.find<RightsListController>();

  CheckInternet checkInternet = CheckInternet();
  // rightsfunction() async {
  //   // await Get.find<RightsListController>().getrightslist(id: 2022);
  // }

  @override
  void initState() {
    // Get.find<CustomerListContoller>().getcustomerlist();
    // Get.find<NewController>().newgetItemList();
    // Get.find<CashCustomerListContoller>().getcashCustomerlist(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // customerListController.getcustomerlist();
    Get.log('Read token is ${GetStorage().read('token')}');
    // rightslistcontroller.getrightslist(id: 2022);
    RightsListModel? rightsList = rightslistcontroller.rightslist.value;
    List<RightsList> filteredList = rightsList?.listdata ?? [];
    Get.log('My Filtered List is ${filteredList}');
    List<String?> mylist = [];
    for (int i = 0; i < filteredList.length; i++) {
      mylist.add(filteredList[i].menuName);
    }
    Get.log('......${filteredList}');
    
for (var item in filteredList) {
  print('item: ${item}'); // Assuming the RightsList class has a proper toString() implementation
}
    // if(filteredList.contains('RateChange')){
    //   GetStorage().write('RateChange', 1);
    // }
    // else{
    //   GetStorage().write('RateChange', 0);
    // }
    Get.log('My list is now ${mylist}');
    if(mylist.contains('RateChange')){
      GetStorage().write('RateChange', 1);
    }
    else{
      GetStorage().write('RateChange', 0);
    }
    Get.log('_____ratechangeValue : ${GetStorage().read('RateChange')}');
    Get.log('I am in Build');
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Exit the app
        return true;
      },
      child: Scaffold(
          body: FutureBuilder(
        future: api_provider.getRightsListFromAPI(
            id: GetStorage().read('SalesmanId')),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Get.log('snapshot Error : ${snapshot.hasError}');
          } else if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: double.infinity,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                    height: 40,
                                    width: 50,
                                    child: Image.asset(
                                        'assets/images/launcher_icon.png')),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  onTap: () {
                                    GetStorage().erase();
                                    GetStorage().remove('token');
                                    Get.off(() => SiginIn());
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 140,
                                    decoration:
                                        BoxDecoration(color: Colors.black),
                                    child: Row(children: [
                                      Text(
                                        'CLOSE APP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OoohBaby',
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset('assets/images/logout.jpg'),
                                    ]),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Center(
                          //     child: Text(
                          //   "ADMIN  DASHBOARD4",
                          //   style: TextStyle(
                          //       fontSize: 30,
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold),
                          // )),
                          Text(
                            " ${widget.fullname}",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ), // ... Your existing code

                  SizedBox(height: 20),

                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 20,
                    runSpacing: 40,
                    children: [
                      if (mylist.contains("SaleOrder"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => CashCredit2());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child:
                                        Image.asset('assets/images/img1.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "SALES ORDER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          // Container for CustomerLedger
                        ),

                      if (mylist.contains("CustomerList"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  var internet = await checkInternet
                                      .checkInternetConnection();

                                  print("${internet}");
                                  if (!internet) {
                                    Get.back();
                                    Utils.flushBarErrorMessage(
                                        'No internet Connection', context);
                                  } else {
                                    // await customerListController.getcustomerlist();
                                    Get.to(() => SearchCustomer());
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child:
                                        Image.asset('assets/images/img3.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CUSTOMERS",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Container for CustomerList
                        ),
                      if (mylist.contains("ItemsList"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  var internet = await checkInternet
                                      .checkInternetConnection();

                                  print("${internet}");
                                  if (!internet) {
                                    Get.back();
                                    Utils.flushBarErrorMessage(
                                        'No internet Connection', context);
                                  } else {
                                    await Get.find<NewController>()
                                        .newgetItemList();
                                    Get.to(() => const ItemSearch());
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child:
                                        Image.asset('assets/images/items.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "ITEMS LIST",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          // Container for ItemsList
                        ),

                      if (mylist.contains("CustomerLedger"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => SelectLedgerCustomer());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/images/balance.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "LEDGER ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          // Container for ItemsList
                        ),
                      if (mylist.contains("StoreTransfer"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  await Get.find<WarehouseListController>()
                                      .getWarehouseList();
                                  Get.to(() => Select(
                                        title: 'WareHouse',
                                        SalesmanId:
                                            GetStorage().read('SalesmanId'),
                                      ));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/images/warehouse.png')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "STORE  ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                          // Container for ItemsList
                        ),

                      if (mylist.contains("ItemsList"))
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 40,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // await customerListController.getcustomerlist();
                                  Get.to(() => Recovery());
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    height: 85,
                                    width: 100,
                                    child: Image.asset('assets/images/5.jpg')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "RECOVERY ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          // Container for ItemsList
                        ),
                      // ... Other containers based on menu items
                    ],
                  ),

                  // ... Your existing code
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }

  Future<bool> showExitConfirmationToast() async {
    // Show toast message with exit confirmation
    Fluttertoast.showToast(
      msg: "Press back again to exit",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
    );

    // Delay for a short moment to allow the toast message to display
    await Future.delayed(Duration(milliseconds: 2000));

    // Return false to prevent app from being closed
    return false;
  }
}
