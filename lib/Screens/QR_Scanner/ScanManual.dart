import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/QRScanController.dart';
import 'package:quest/controllers/itemDetailsbyCodeController.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quest/Screens/QR_Scanner/BillingScreen.dart';
import 'package:quest/Screens/QR_Scanner/billingstate.dart';
// import 'package:quest/Screens/QR_Scanner/billing.dart';
import 'package:quest/Screens/QR_Scanner/selectManualItems.dart';
import 'package:quest/controllers/QRScanController.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/widgets/customAppbar.dart';
import 'package:quest/widgets/roundbutton.dart';
import 'package:get/get.dart';

import '../../controllers/CustomerListController.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ScanManual extends StatefulWidget {
  final String customerType;
  final String customerName;
  final String cityName;
  final int customerCode;
  final String urduName;
  final int percentage;

  const ScanManual({
    super.key,
    required this.customerName,
    required this.cityName,
    required this.customerCode,
    required this.urduName,
    required this.percentage,
    required this.customerType,
  });

  @override
  State<ScanManual> createState() => _ScanManualState();
}

class _ScanManualState extends State<ScanManual> {
   ItemDetailsbyCodeController itemDetailsbyCodeController =
      Get.put<ItemDetailsbyCodeController>(ItemDetailsbyCodeController());   
  double totalGrossValue = 0;
  String _scanBarcode = 'Unknown';
  final box = GetStorage();
  List<Map<String, dynamic>> mylist = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> scanBarcodeNormal() async {
  //   String barcodeScanRes;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(barcodeScanRes);
  //   } on PlatformException {
  //     barcodeScanRes = 'Failed to get platform version.';
  //   }

  //   // If the widget was removed from the tree while the asynchronous platform
  //   // message was in flight, we want to discard the reply rather than calling
  //   // setState to update our non-existent appearance.
  //   if (!mounted) return;

  //   setState(() {
  //     _scanBarcode = barcodeScanRes;
  //   });
  // }
  //Scan

  TextEditingController _updatedquantity = TextEditingController();
  TextEditingController newSalePriceController = TextEditingController();
  // CustomerListContoller customercontroller = Get.find<CustomerListContoller>();
  //----------//Add Manually----------------------------
  TextEditingController _itemIdController = TextEditingController();
  TextEditingController _itemNameController = TextEditingController();
  TextEditingController _urduNameController = TextEditingController();
  TextEditingController _colorNameController = TextEditingController();
  TextEditingController _colorIdController = TextEditingController();
  TextEditingController _salePriceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

//-----------------------------------------------------------///------------------

  QRscanController qRscanController =
      Get.put<QRscanController>(QRscanController());

  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController itemnotecontroller = TextEditingController();

  List<Listdata> data = [];
  String CustomerType = '';
  // List<Map<String, dynamic>> controller.list2 = [];

  @override
  Widget build(BuildContext context) {
    final GetStorage storage = GetStorage();
    List<dynamic>? data = storage.read('myKey');
    Get.log("My Data Now  ${data ?? 'NO dATA'}");

    Get.log(
        'customer Name :${widget.customerName}  customerId :${widget.customerCode}');
    // GetStorage().erase();
    // print("At time of Build ${GetStorage().read('myKey').length}");
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Scan Products',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: GetBuilder<QRscanController>(builder: (controller) {
       
        return SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
            
        
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: InkWell(
                          onTap: () async {

                            int rightsvalue=GetStorage().read('RateChange');
                            await scanQR();
                            await controller.getQRData(qr_code: _scanBarcode);
                            await itemDetailsbyCodeController.getitemdetailsbyCode(id: controller.itemDetailedByQrModel!.data!.itemId,code: widget.customerCode);
        
                            print(" AERo ${_scanBarcode}");
                            print(
                                " length after getching qr data ${controller.list1.length}");
                            double saleprice = double.parse(controller
                                .itemDetailedByQrModel!.data!.salePrice
                                .toString());
                            double newPrice =
                                saleprice + (widget.percentage / 100) * saleprice;
                            print("New Price =${newPrice}");
                            newSalePriceController.text='${newPrice}';
                            controller.update();
        
                            
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.info,
                              body: SizedBox(
                                height: 350,
                                child: ListView.builder(
                                  itemCount: controller.list1.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        controller.itemDetailedByQrModel == null
                                            ? SizedBox()
                                            : Container(
                                              margin: EdgeInsets.all(10),
                                              color: Colors.white,
        
        
        child: Column(children: [
                                                    Row(children: [
                                                      Text('${controller.itemDetailedByQrModel!.data!.itemName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
                                                    ],),
                                                    Row(children: [
                                                      Text('${controller.itemDetailedByQrModel!.data!.colorName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                                      Expanded(child: SizedBox()),
                                                      Text('${controller.itemDetailedByQrModel!.data!.urduName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
                                                    ],),
                                                 
                                             
                                                 
                                                
                                                   Row(children: [
                                                    Text('${itemDetailsbyCodeController.list.data!.lastSalePrice}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                                   ],),
                                                  Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 16.0),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text('Sale Price',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                                  ],),
                                  
                                 if(rightsvalue==0)Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black), // Set the border color
    borderRadius: BorderRadius.circular(8.0), // Set the border radius
  ),
  child: Text(
    '${newPrice}',
    style: TextStyle(fontSize: 16.0), // Set the text style
  ),
),
if (rightsvalue == 1)
TextFormField(
  controller: newSalePriceController,
  keyboardType:TextInputType.number,
          decoration: InputDecoration(
            // hintText: '${newPrice}',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black), // Set the border color
              borderRadius: BorderRadius.circular(8.0), // Set the border radius
            ),
          ),
        ), 



        
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 16.0),
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text('Quantity',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                                  ],),
                                   TextFormField(
                                    keyboardType:TextInputType.number,
                                    controller: quantitycontroller,
          decoration: InputDecoration(
            hintText: '',
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black), // Set the border color
              borderRadius: BorderRadius.circular(8.0), // Set the border radius
            ),
          ),
        ),
        
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                                                  
                                                  
                                                 
                                                 
                    //                               if (rightsvalue==0)
                    //                                             Padding(
                    //                                               padding:
                    //                                                   const EdgeInsets
                    //                                                           .only(
                    //                                                       top:
                    //                                                           10),
                    //                                               child:
                    //                                                   Container(
                    //                                                 width: MediaQuery.of(
                    //                                                         context)
                    //                                                     .size
                    //                                                     .width,
                    //                                                 decoration:
                    //                                                     BoxDecoration(
                    //                                                   color: Colors
                    //                                                       .amber,
                    //                                                   borderRadius:
                    //                                                       BorderRadius.circular(
                    //                                                           10),
                    //                                                   boxShadow: [
                    //                                                     BoxShadow(
                    //                                                       color: Colors
                    //                                                           .grey
                    //                                                           .withOpacity(0.5),
                    //                                                       spreadRadius:
                    //                                                           2,
                    //                                                       blurRadius:
                    //                                                           5,
                    //                                                       offset: Offset(
                    //                                                           0,
                    //                                                           3),
                    //                                                     ),
                    //                                                   ],
                    //                                                 ),
                    //                                                 child:
                    //                                                     Padding(
                    //                                                   padding: const EdgeInsets
                    //                                                           .all(
                    //                                                       15.0),
                    //                                                   child:
                    //                                                       Column(
                    //                                                     crossAxisAlignment:
                    //                                                         CrossAxisAlignment
                    //                                                             .start,
                    //                                                     children: [
                    //                                                       Text(
                    //                                                         'Sale Price  :${newPrice} ',
                    //                                                         style: TextStyle(
                    //                                                             fontSize: 16,
                    //                                                             fontWeight: FontWeight.w600),
                    //                                                       ),
                    //                                                     ],
                    //                                                   ),
                    //                                                 ),
                    //                                               ),
                    //                                             ),
                    //                                             if (rightsvalue == 1)
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10),
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: BoxDecoration(
                    //       color: Colors.amber,
                    //       borderRadius: BorderRadius.circular(5),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.5),
                    //           spreadRadius: 2,
                    //           blurRadius: 5,
                    //           offset: Offset(0, 3),
                    //         ),
                    //       ],
                    //     ),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(2.0),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           TextFormField(
                    //             onChanged: (value) {
                    //               // controller.update();
                    //             },
                    //             controller: newSalePriceController,
                    //             decoration: InputDecoration(
                    //               labelText: 'Enter SalePrice',
                    //               border: OutlineInputBorder(),
                    //               prefixIcon: Icon(Icons.person),
                    //               suffixIcon: IconButton(
                    //                 icon: Icon(Icons.clear),
                    //                 onPressed: () {},
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                            
                                                 
                                                 
                                                  // Padding(
                                                  //   padding:
                                                  //       const EdgeInsets.only(
                                                  //           top: 10),
                                                  //   child: Container(
                                                  //     width:
                                                  //         MediaQuery.of(context)
                                                  //             .size
                                                  //             .width,
                                                  //     decoration: BoxDecoration(
                                                  //       color: Colors.amber,
                                                  //       borderRadius:
                                                  //           BorderRadius.circular(
                                                  //               5),
                                                  //       boxShadow: [
                                                  //         BoxShadow(
                                                  //           color: Colors.grey
                                                  //               .withOpacity(0.5),
                                                  //           spreadRadius: 2,
                                                  //           blurRadius: 5,
                                                  //           offset: Offset(0, 3),
                                                  //         ),
                                                  //       ],
                                                  //     ),
                                                  //     child: Padding(
                                                  //       padding:
                                                  //           const EdgeInsets.all(
                                                  //               2.0),
                                                  //       child: Column(
                                                  //         crossAxisAlignment:
                                                  //             CrossAxisAlignment
                                                  //                 .start,
                                                  //         children: [
                                                  //           TextFormField(
                                                  //             keyboardType:
                                                  //                 TextInputType
                                                  //                     .number,
                                                  //             onChanged: (value) {
                                                  //               controller
                                                  //                   .update();
                                                  //             },
                                                  //             controller:
                                                  //                 quantitycontroller,
                                                  //             decoration:
                                                  //                 InputDecoration(
                                                  //               labelText:
                                                  //                   'Enter Quantity',
                                                  //               border:
                                                  //                   OutlineInputBorder(),
                                                  //             ),
                                                  //           )
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                 
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5),
                                                        boxShadow: [
                                                          // BoxShadow(
                                                          //   // // // color: Colors.grey
                                                          //   // //     .withOpacity(0.5),
                                                          //   // spreadRadius: 2,
                                                          //   // blurRadius: 5,
                                                          //   // offset: Offset(0, 3),
                                                          // ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                2.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            TextFormField(
                                                              onChanged: (value) {
                                                                controller
                                                                    .update();
                                                              },
                                                              controller:
                                                                  itemnotecontroller,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Item Note',
                                                                border:
                                                                    OutlineInputBorder(),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Center(
                                                          child: Row(
                                                            children: [
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    String
                                                                        scannedColorName =
                                                                        qRscanController!
                                                                            .itemDetailedByQrModel!
                                                                            .data!
                                                                            .colorName;
                                                                    int?
                                                                        scannedItemId =
                                                                        qRscanController!
                                                                            .itemDetailedByQrModel!
                                                                            .data!
                                                                            .itemId;
        
                                                                    List<dynamic>?
                                                                        data =
                                                                        storage.read(
                                                                            'myKey');
                                                                    // Check if scanned colorName and itemId already exist in local list
                                                                    int matchingIndex =
                                                                        -1;
                                                                    if (data !=
                                                                        null) {
                                                                      for (int i =
                                                                              0;
                                                                          i < data.length;
                                                                          i++) {
                                                                        if (data[i]['colorName'] ==
                                                                                scannedColorName &&
                                                                            data[i]['itemID'] ==
                                                                                scannedItemId) {
                                                                          matchingIndex =
                                                                              i;
                                                                          break;
                                                                        }
                                                                      }
                                                                    }
                                                                    if (matchingIndex !=
                                                                        -1) {
                                                                      // Show a dialogue asking the user to update the quantity
                                                                      showDialog(
                                                                        context:
                                                                            context, // Replace with your UI context
                                                                        builder:
                                                                            (BuildContext
                                                                                context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Item Already Exists'),
                                                                            content:
                                                                                Container(
                                                                              height:
                                                                                  100,
                                                                              child:
                                                                                  Column(
                                                                                children: [
                                                                                  Text('Item with the same color name and ID already exists.'),
                                                                                  TextField(
                                                                                    controller: _updatedquantity,
                                                                                    decoration: InputDecoration(labelText: 'Enter Quantity'),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  String existingSalePrice = data![matchingIndex]['salePrice'];
                                                                                  double existingSP = double.parse(existingSalePrice) ;
                                                                                  Get.log('____existing ${existingSalePrice} ');
                                                                                  // Update the quantity locally and close the dialogue
                                                                                  String newQuantity = _updatedquantity.text;
                                                                                  data![matchingIndex]['qty'] = int.parse(newQuantity);
                                                                                  double multipliedSalePrice = existingSP * int.parse(newQuantity);
                                                                                  
                                                                                  // data![matchingIndex]['salePrice'] = multipliedSalePrice;
                                                                                  data![matchingIndex]['grossValue'] = multipliedSalePrice;
                                                                                  storage.write('myKey', data);                                                                               
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('Yes'),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  _updatedquantity.clear();
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Text('No'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    } else {
                                                                      //ontap additem
                                                                      double
                                                                          quantity =
                                                                          double.parse(quantitycontroller
                                                                              .text
                                                                              .toString());
        
                                                                      print(
                                                                          "New SalePrice:${newPrice}");
                                                                      print(
                                                                          "Customer Code : ${widget.customerCode}");
                                                                      double d =
                                                                          saleprice *
                                                                              quantity;
                                                                      controller
                                                                              .count
                                                                              .value =
                                                                          saleprice *
                                                                              quantity;
        
                                                                      List<dynamic>
                                                                          existingData =
                                                                          GetStorage().read<List<dynamic>>('myKey') ??
                                                                              [];
        
                                                                      qRscanController
                                                                              .list2 =
                                                                          List.from(
                                                                              existingData);
        
                                                                      controller
                                                                          .update();
                                                                     double newSalePrice = double.parse(newSalePriceController.text.toString());
                                                                      if(rightsvalue==0){
                                                                          controller
                                                                          .list1 = [
                                                                        {
                                                                          //add to list
                                                                          'CustomerCode':
                                                                              widget.customerCode,
                                                                          'CustomerName':
                                                                              widget.customerName,
                                                                          'itemID': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .itemId,
        
                                                                          'itemName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .itemName,
                                                                          'urduName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .urduName,
                                                                          'colorName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .colorName,
                                                                          'colorID': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .colorId,
                                                                          'salePrice':
                                                                              newPrice,
                                                                          'qty': int.parse(quantitycontroller
                                                                              .text
                                                                              .toString()),
                                                                          'itemNote': itemnotecontroller
                                                                              .text
                                                                              .toString(),
                                                                          'grossValue':
                                                                              quantity *
                                                                                  newPrice,
                                                                        }
                                                                      ];
                                                                      }
                                                                      else{
                                                                          controller
                                                                          .list1 = [
                                                                        {
                                                                          //add to list
                                                                          'CustomerCode':
                                                                              widget.customerCode,
                                                                          'CustomerName':
                                                                              widget.customerName,
                                                                          'itemID': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .itemId,
        
                                                                          'itemName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .itemName,
                                                                          'urduName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .urduName,
                                                                          'colorName': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .colorName,
                                                                          'colorID': qRscanController
                                                                              .itemDetailedByQrModel!
                                                                              .data!
                                                                              .colorId,
                                                                          'salePrice':
                                                                              newSalePriceController.text,
                                                                          'qty': int.parse(quantitycontroller
                                                                              .text
                                                                              .toString()),
                                                                          'itemNote': itemnotecontroller
                                                                              .text
                                                                              .toString(),
                                                                          'grossValue':
                                                                              quantity *
                                                                                  newSalePrice,
                                                                        }
                                                                      ];
                                                                      }
                                                                    
                                                                      print(
                                                                          "List 1 =${controller.list1}");
        
                                                                      controller
                                                                          .list2
                                                                          .addAll(
                                                                              controller.list1);
        
                                                                      await GetStorage().write(
                                                                          'myKey',
                                                                          qRscanController
                                                                              .list2);
                                                                      qRscanController
                                                                          .update();
                                                                      Get.log(
                                                                          "List after writing abc ${GetStorage().read('myKey')}");
        
                                                                    
                                                                          
                                                                    
                                                                      controller
                                                                          .update();
        
                                                                      // controller.list1
                                                                      //     .clear();
        // //----------------------------------------------------------
                                                                      quantitycontroller
                                                                          .text = '';
                                                                      await scanQR();
                                                                      await controller.getQRData(
                                                                          qr_code:
                                                                              _scanBarcode);
                                                                      quantitycontroller
                                                                          .text = '';
                                                                      // quantitycontroller
                                                                      //     .dispose();
                                                                      // // Add the new item to the list
                                                                      // data ??= [];
                                                                      // Map<String, dynamic> newItem = {
                                                                      //   'colorName': scannedColorName,
                                                                      //   'itemID': scannedItemId,
                                                                      //   // Add other item properties as needed
                                                                      // };
                                                                      // data.add(newItem);
                                                                      // storage.write('myKey', data);
                                                                        controller
                                                                          .list1=[];
                                                                    }
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .black, // Change the color here
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                    "Add Item",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  )),
                                                              SizedBox(
                                                                width: 20,
                                                              ),
                                                              ElevatedButton(
                                                                  onPressed: () {
                                                                    controller.list1=[];
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Colors
                                                                        .black, // Change the color here
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  child: Text(
                                                                      "Cancel")),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                
        ]),                                            
                                                
                                              ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              title: 'This is Ignored',
                              desc: 'This is also Ignored',
                            ).show();
                          },
                          child: Container(
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Text(
                              "Scan QR Code",
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(),
                      InkWell(
                        onTap: () async {
                          // CircularProgressIndicator();
                          // bool isLoading = true;
                          await Get.find<NewController>().newgetItemList();
                          // isLoading = false;
                          Get.to(() =>
                              //add missing
                              SelectManualItems(
                                percentage: widget.percentage,
                                customerName: widget.customerName,
                                CustomerCode: widget.customerCode,
                              ));
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Add manually",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // RoundButton(
                      //     title: 'Scan QR ',
                      //     onPress: () async {
                      //       // controller.list1.addAll(controller.list1);
                      //       // controller.list1.clear();
                      //       // print(" length after dialogue ${controller.list1.length}");
                      //     }),
                    ],
                  ),
                ),
        
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Your Scanned Product Details ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
        
                storage.read('myKey') == null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 500,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: GetStorage().read('myKey').length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF7CAC9),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${GetStorage().read('myKey')[index]['itemName']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                // color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
        
                                          //scanned
                                          // Text(
                                          //   'Item Id  ${GetStorage().read('myKey')[index]['itemID']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
        
                                          // Text(
                                          //   '${GetStorage().read('myKey')[index]['CustomerName']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          // Text(
                                          //   'Customer Code :${GetStorage().read('myKey')[index]['CustomerCode']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          // Text(
                                          //   'Item ID  :${GetStorage().read('myKey')[index]['itemID']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
        
                                          Text(
                                            '${GetStorage().read('myKey')[index]['urduName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
        
                                          // Text(
                                          //   'ColorId :${GetStorage().read('myKey')[index]['colorID']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          Text(
                                            'ColorName   :   ${GetStorage().read('myKey')[index]['colorName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          //continue sale
                                          Text(
                                            'Sale Price     :   ${GetStorage().read('myKey')[index]['salePrice']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Qty                 :   ${GetStorage().read('myKey')[index]['qty']}',
                                            // 'Sale Price =${controller.list1[index]['data']['salePrice']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Item Note     :    ${GetStorage().read('myKey')[index]['itemNote']}',
                                            // 'Sale Price =${controller.list1[index]['data']['salePrice']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Gross Value :    ${GetStorage().read('myKey')[index]['grossValue']}',
                                            // 'Sale Price =${controller.list1[index]['data']['salePrice']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
        
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              onPrimary: Colors.white,
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            onPressed: () {
                                              print("Delete working${index}");
                                              List<dynamic> myList =
                                                  GetStorage().read('myKey');
                                              myList.removeAt(index);
                                              controller.update();
                                            },
                                            child: Text('DELETE'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                "Delete  Items List",
                                style: TextStyle(color: Colors.red),
                              ),
                              content: Text(
                                  "Are you sure you want to Delete  Items List?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    GetStorage().remove('myKey');
                                    
                                    controller.list2.clear();
                                    controller.update();
        
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Clear List",
                          style: TextStyle(color: Colors.red),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () async {
                        // calculate Gross Value
                        double TotalGrossAmount = calculateGross();
                        Get.log("TOtal Gross : ${TotalGrossAmount}");
                        Get.log('Urdu Name is ${widget.urduName}');
                        await Get.to(Bill(
                          customerUrduName: widget.urduName,
                          itemNote: itemnotecontroller.text.toString(),
                          customerCode: widget.customerCode,
                          percentage: widget.percentage,
                          grossTotal: totalGrossValue,
                          customerName: '${widget.customerName}',
                          customertype: '${widget.customerType}',
                        ));
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text(
                          "Check Out",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ]),
                ),
                // InkWell(
                //   onTap: () {
                //     final GetStorage storage = GetStorage();
                //     List<dynamic>? listofdata = storage.read('myKey');
                //     Get.log("Whole Data :  ${listofdata!}");
                //   },
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     child: Text('CheckListStatus'),
                //   ),
                // ),
        
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
        );
        
      }),
    );
  }

  double calculateGross() {
    List<dynamic> data = GetStorage().read('myKey');
    // Iterate through the data and accumulate the gross values
    for (int index = 0; index < data.length; index++) {
      double grossValue = data[index]['grossValue'];
      totalGrossValue += grossValue;
    }
    return totalGrossValue;
  }

  // void _showItemDetailsDialogue(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Item Details'),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TextFormField(
  //                 controller: _itemIdController,
  //                 decoration: InputDecoration(labelText: 'Item ID'),
  //               ),
  //               TextFormField(
  //                 controller: _itemNameController,
  //                 decoration: InputDecoration(labelText: 'Item Name'),
  //               ),
  //               TextFormField(
  //                 controller: _urduNameController,
  //                 decoration: InputDecoration(labelText: 'Urdu Name'),
  //               ),
  //               TextFormField(
  //                 controller: _colorNameController,
  //                 decoration: InputDecoration(labelText: 'Color Name'),
  //               ),
  //               TextFormField(
  //                 controller: _colorIdController,
  //                 decoration: InputDecoration(labelText: 'Color ID'),
  //               ),
  //               TextFormField(
  //                 controller: _salePriceController,
  //                 decoration: InputDecoration(labelText: 'Sale Price'),
  //                 keyboardType: TextInputType.number,
  //               ),
  //               TextFormField(
  //                 controller: _quantityController,
  //                 decoration: InputDecoration(labelText: 'Quantity'),
  //                 keyboardType: TextInputType.number,
  //               ),
  //               Text(
  //                   'Gross Value: ${(int.parse(_quantityController.text) * double.parse(_salePriceController.text)).toString()}'),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text('Cancel'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               var itemDetails = {
  //                 'itemID': _itemIdController.text,
  //                 'itemName': _itemNameController.text,
  //                 'urduName': _urduNameController.text,
  //                 'colorName': _colorNameController.text,
  //                 'colorID': _colorIdController.text,
  //                 'salePrice': double.parse(_salePriceController.text),
  //                 'qty': _quantityController.text,
  //                 'grossValue': int.parse(_quantityController.text) *
  //                     double.parse(_salePriceController.text),
  //               };
  //               // Do something with itemDetails here
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
