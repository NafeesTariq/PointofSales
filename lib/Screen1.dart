import 'package:flutter/material.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/controllers/CashCustomerListController.dart';
import 'package:quest/controllers/CustomerListController.dart';
import 'package:get/get.dart';
import 'package:quest/controllers/ItemColorListController.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/LedgerBalanceController.dart';
import 'package:quest/controllers/SaveShopController.dart';
import 'package:quest/controllers/WarehouseListCOntroller.dart';
import 'package:quest/controllers/itemDetailsbyIdController.dart';
import 'package:quest/models/SaveShopSaleModel.dart';
import 'package:quest/models/LedgerBalanceModel.dart';

import 'models/separate_itemlist.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  List<Map<String, dynamic>> invoiceDetail = [
    {
      'itemID': 0,
      'uomId': 0,
      'qty': 0,
      'rate': 0,
      'discountType': '',
      'discount': 0,
      'netRate': 0,
      'grossValue': 0,
      'colorID': 0,
    },
  ];
  CustomerListContoller customerlistcontroller =
      Get.put(CustomerListContoller());
  SaveShopController saveShopController = Get.put(SaveShopController());
  // ItemListController itemlistController = Get.put(ItemListController());
  ItemModelNew newitemlistController = Get.put(ItemModelNew());
  WarehouseListController warehouseListCOntroller =
      Get.put(WarehouseListController());
  NewController newController = Get.put(NewController());

  Api_Provider api_provider = Api_Provider();
  String qrcodetext = 'ABC';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API Testing Screen")),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await api_provider.loginAPI(username: "quest", password: "admin");
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text("Login API ")),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await customerlistcontroller.getcustomerlist();
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text("Hit Customer List API")),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await newController.newgetItemList();
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text(" Item API STATUS")),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await api_provider.getitemDetailbyQR(qrcode: qrcodetext);
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text("QR API Status")),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // InkWell(
          //   onTap: () async {
          //     await ItemColorListController().getItemColorList(id: 3088);
          //   },
          //   child: Center(
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(color: Colors.amber),
          //       child: Center(child: Text("Status itemmColorList")),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // InkWell(
          //   onTap: () async {
          //     await ItemDetailsbyIdController().getitemdetails(id: 3088);
          //   },
          //   child: Center(
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(color: Colors.amber),
          //       child: Center(child: Text("Status getItemDetails")),
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () async {
              await CashCustomerListContoller().getcashCustomerlist(context);
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text("Status getItemDetails")),
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // InkWell(
          //   onTap: () async {
          //     await LegderBalanceController().GetLedgerBalance(detailedCode: 0);
          //   },
          //   child: Center(
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(color: Colors.amber),
          //       child: Center(child: Text("API Ledger Balance")),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await warehouseListCOntroller.getWarehouseList();
              // Get.to(() => WarehouseDropdown());
            },
            child: Center(
              child: Container(
                height: 50,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(child: Text("WAREHOUSE ")),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () async {
          //     await saveShopController.SaveShopAPI(
          //         cashCustomerName: 'Ali',
          //         computerNo: '',
          //         detailCode: 0,
          //         exchangeRate: 0,
          //         grossTotal: 0,
          //         invoiceType: 0,
          //         remarks: '',
          //         invoiceDetail: invoiceDetail);
          //     // await api_provider.saveshopsaleAPI(computerNo: '0', type: '0');
          //     // await CashCustomerListContoller().getcashCustomerlist();
          //   },
          //   child: Center(
          //     child: Container(
          //       height: 50,
          //       decoration: BoxDecoration(color: Colors.amber),
          //       child: Center(child: Text("Save Shop")),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }

// Rest of the postDataToApi function goes here (as previously mentioned)
}
