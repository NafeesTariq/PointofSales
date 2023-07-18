import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screens/QR_Scanner/ScanManual.dart';
import 'package:quest/Screens/QR_Scanner/chooseColor.dart';
import 'package:quest/controllers/ItemColorListController.dart';
import 'package:quest/controllers/ItemController.dart';
import 'package:quest/controllers/QRScanController.dart';
import 'package:quest/controllers/itemDetailsbyCodeController.dart';
import 'package:quest/controllers/itemDetailsbyIdController.dart';
import 'package:quest/models/ItemDetailByCode.dart';
import 'package:quest/models/customer_list_model.dart';
import 'package:quest/models/separate_itemlist.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/CustomerListController.dart';

class SelectManualItems extends StatefulWidget {
  // final String customerType;
  final int percentage;
  final String customerName;
  final int CustomerCode;
  String colornamevalue = '';
  String colorId = '0';
  String ColorName = '0';
  int ColorId = 0;

  TextEditingController quantityController = TextEditingController();

  SelectManualItems({
    super.key,
    required this.percentage,
    required this.customerName,
    required this.CustomerCode,
  });

  @override
  State<SelectManualItems> createState() => _SelectManualItemsState();
}

class _SelectManualItemsState extends State<SelectManualItems> {
  TextEditingController _updatedquantity = TextEditingController();
  TextEditingController newSalePriceController = TextEditingController();
  
  // CustomerListContoller customercontroller = Get.find<CustomerListContoller>();
  // ItemListController itemcontroller = Get.find<ItemListController>();
  // ItemColorListController itemcontroller = Get.put(ItemColorListController());
  QRscanController qRscanController =
      Get.put<QRscanController>(QRscanController());

  NewController itemcontroller = Get.put<NewController>(NewController());
  ItemColorListController itemcontrollers =
      Get.put<ItemColorListController>(ItemColorListController());
  List<Listdatas> data = [];
  List<Datass> datas =[];

  ItemColorListController itemcolorcontroller =
      Get.find<ItemColorListController>();

  ItemDetailsbyIdController itemDetailsbyIdController =
      Get.put<ItemDetailsbyIdController>(ItemDetailsbyIdController());

  ItemDetailsbyCodeController itemDetailsbyCodeController =
      Get.put<ItemDetailsbyCodeController>(ItemDetailsbyCodeController());    

  // TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GetStorage storage = GetStorage();
    // double newPrices =
    //     salepriceforNon + (widget.percentage / 100) * salepriceforNon;
    // print("Percentage : ${widget.percentage}");
    print("CustomerName : ${widget.customerName}");
    return Scaffold(
      appBar: CustomAppBar(
          title: 'ITEMS LIST',
          onBackButtonPressed: () {
            Navigator.pop(context);
          }),
      body: FutureBuilder(
        future: Get.find<NewController>().newgetItemList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Get.log('snapshot Error : ${snapshot.hasError}');
          } else {
            return ListView(
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
                            data = itemcontroller.list.itemlist!
                                .where((element) => element.itemName!.contains(
                                    RegExp(
                                        Get.find<NewController>()
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
                    SizedBox(
                      height: 600,
                      child:
                          Get.find<NewController>().searchtext.text.isNotEmpty
                              ? ListView.separated(
                                  itemBuilder: (context, index) {
                                    var singleData = data[index];
                                    
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () async {

                                          //marked
                                          
                                          await itemDetailsbyCodeController
                                              .getitemdetailsbyCode(
                                                  id: singleData.itemID!,code: widget.CustomerCode);

                                          //Searched
                                          print(
                                              "Item Id tapped ${singleData.itemID}");
                                          await itemcolorcontroller
                                              .getItemColorList(
                                                  id: singleData.itemID!)
                                              .then((value) {
                                            if (itemcolorcontroller
                                                .itemColorList!
                                                .listdata!
                                                .isEmpty) {
                                              Get.log(
                                                  "Searched  No Colour Dialogue........... ");
                                              double saleprice = double.parse(
                                                  itemDetailsbyCodeController
                                                      .list.data!.salePrice
                                                      .toString());

                                              Get.log(
                                                  "Sale Price after parsing :${saleprice}");
                                              double newPrice = saleprice +
                                                  (widget.percentage / 100) *
                                                      saleprice;

                                              print("New Price =${newPrice}");
                                              newSalePriceController.text='${newPrice}';
                                              final String colorName = '0';
                                              final String colorUrduName = '';

                                              // double saleprices = double.parse(
                                              //     singleData.salePrice.toString());

                                              // double newPrice = saleprices +
                                              //                                   //     (widget.percentage / 100) * saleprices;
                                              // print("NewPrice: ${newPrice}");
                                              //1

                                              // checking123
                                              // int rightsvalue= 1;
                                              int rightsvalue=GetStorage().read('RateChange');
                                              Get.log('____rightsvalue is : ${rightsvalue}');
                                              AwesomeDialog(
                                                context: context,
                                                animType: AnimType.scale,
                                                dialogType: DialogType.info,
                                                body: SizedBox(
                                                  height:350,
                                                  child: ListView.builder(
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      TextEditingController
                                                          quantityController =
                                                          TextEditingController();
                                                      TextEditingController
                                                          itemnoteController =
                                                          TextEditingController();
                                                      return Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(children: [
                                                      Text('${singleData.itemName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
                                                    ],),
                                                    SizedBox(height: 10,),
                                                    Row(children: [
                                                      Text('${colorName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                                      Expanded(child: SizedBox()),
                                                      Text('${singleData.urduName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
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
    '123${newPrice}',
    style: TextStyle(fontSize: 16.0), // Set the text style
  ),
),
if (rightsvalue == 1)
TextFormField(
  controller: newSalePriceController,
  keyboardType:TextInputType.number,
          decoration: InputDecoration(
            // labelText: '${newPrice}',
            hintText: '${newPrice}',
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
                                    controller: quantityController,
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
                                                                // controller
                                                                //     .update();
                                                              },
                                                              controller:
                                                                  itemnoteController,
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
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            15),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          ElevatedButton(
                                                                              onPressed: () async {
                                                                                Get.log('____Color name : ${widget.ColorName}');
                                                                                String scannedColorName = widget.ColorName;
                                                                                int? scannedItemId = singleData.itemID;
                                                                                // Retrieve existing data from local storage
                                                                                List<dynamic>? data = storage.read('myKey');

                                                                                // Check if scanned colorName and itemId already exist in local list
                                                                                int matchingIndex = -1;
                                                                                if (data != null) {
                                                                                  for (int i = 0; i < data.length; i++) {
                                                                                    if (data[i]['colorName'] == scannedColorName && data[i]['itemID'] == scannedItemId) {
                                                                                      matchingIndex = i;
                                                                                      break;
                                                                                    }
                                                                                  }
                                                                                }

                                                                                if (matchingIndex != -1) {
                                                                                  // Show a dialogue asking the user to update the quantity
                                                                                  showDialog(
                                                                                    context: context, // Replace with your UI context
                                                                                    builder: (BuildContext context) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Item Already Exists'),
                                                                                        content: Container(
                                                                                          height: 100,
                                                                                          child: Column(
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
                                                                                              // Close the dialogue without updating the quantity
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            child: Text('No'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  double quantity = double.parse(quantityController.text.toString());
                                                                                  double grossValue = newPrice * quantity;
                                                                                  //yesss
                                                                                  Get.log("List Before writing ${GetStorage().read('myKey')}");

                                                                                  List<dynamic> existingData = GetStorage().read<List<dynamic>>('myKey') ?? [];
                                                                                  qRscanController.list2 = List.from(existingData);

                                                                                  // List<dynamic>
                                                                                  //     newList =
                                                                                  //     List.from(
                                                                                  //         existingData);
                                                                                  double newsale=double.parse(newSalePriceController.text.toString()) ;
                                                                                 double  newgross= newsale*quantity;
                                                                                  if(rightsvalue==0){
                                                                                    qRscanController.list1 = [
                                                                                    {
                                                                                      'CustomerCode': widget.CustomerCode,
                                                                                      'CustomerName': widget.customerName,
                                                                                      'itemID': singleData.itemID,
                                                                                      'itemName': singleData.itemName,
                                                                                      'urduName': singleData.urduName,
                                                                                      'colorName': widget.ColorName,
                                                                                      'colorID': widget.ColorId,
                                                                                      'salePrice': newPrice,
                                                                                      'qty': int.parse(quantityController.text.toString()),
                                                                                      'itemNote': itemnoteController.text.toString(),
                                                                                      'grossValue': grossValue,
                                                                                    }
                                                                                  ];
                                                                                  }
                                                                                  else{
                                                                                   qRscanController.list1 = [
                                                                                    {
                                                                                      'CustomerCode': widget.CustomerCode,
                                                                                      'CustomerName': widget.customerName,
                                                                                      'itemID': singleData.itemID,
                                                                                      'itemName': singleData.itemName,
                                                                                      'urduName': singleData.urduName,
                                                                                      'colorName': widget.ColorName,
                                                                                      'colorID': widget.ColorId,
                                                                                      'salePrice': newSalePriceController.text,
                                                                                      'qty': int.parse(quantityController.text.toString()),
                                                                                      'itemNote': itemnoteController.text.toString(),
                                                                                      'grossValue': newgross,
                                                                                    }
                                                                                  ]; 
                                                                                  }
                                                                                  

                                                                                  qRscanController.list2.addAll(qRscanController.list1);

                                                                                  await GetStorage().write('myKey', qRscanController.list2);
                                                                                  qRscanController.update();
                                                                                  Get.log("List after writing abc ${GetStorage().read('myKey')}");
                                                                                  qRscanController.list1.clear();
                                                                                  // qRscanController
                                                                                  //     .list2
                                                                                  //     .clear();

                                                                                  Navigator.of(context).pop();
                                                                                }
                                                                                itemcontroller.searchtext.text='';
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.black, // Change the color here
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                              ),
                                                                              //on search
                                                                              child: Text("Add Item")),
                                                                         
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.black, // Change the color here
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                              ),
                                                                              child: Text("Cancel")),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
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
                                            } else {
                                              Get.log(
                                                  "Searched Color Found Dialogue ");
                                              //without...........
                                              print(itemcolorcontroller
                                                  .itemColorList!.listdata);
                                              print(itemcolorcontroller
                                                  .itemColorList!
                                                  .listdata![index]
                                                  .colorName);
                                              print("Colour Found");
                                              print(itemcolorcontroller
                                                  .itemColorList!
                                                  .listdata!
                                                  .length);
                                              //choosing color
                                              showCustomBottomSheet(
                                                  context: context,
                                                  ItemId: singleData.itemID!,
                                                  ItemName:
                                                      singleData.itemName!,
                                                  urduName:
                                                      singleData.urduName!);
                                            }
                                          });
                                          //else end non searched
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Item Name  :${singleData.itemName}'),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Urdu Name:${singleData.urduName}'),
                                                  Text(""),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
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
                              //searched start
                              : ListView.separated(
                                  itemCount:
                                      itemcontroller.list.itemlist?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    var singleData =
                                        itemcontroller.list.itemlist![index];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () async {
                                          //hitting detailbycode 
                                          await itemDetailsbyCodeController
                                              .getitemdetailsbyCode(
                                                  id: singleData.itemID!,code: widget.CustomerCode);
                                          await itemDetailsbyIdController
                                              .getitemdetails(
                                                  id: singleData.itemID!);
                                          //Searched
                                          print(
                                              "Item Id tapped ${singleData.itemID}");

                                          
                                          //await     
                                          //searched
                                          await itemcolorcontroller
                                              .getItemColorList(
                                                  id: singleData.itemID!)
                                              .then((value) {
                                            Get.log('>>>>>>>>>>>');

                                            Get.log(
                                                "${itemcolorcontroller.itemColorList!.listdata!.isEmpty}");
                                            if (itemcolorcontroller
                                                .itemColorList!
                                                .listdata!
                                                .isEmpty) {
                                              print("no Colour Found");
                                              Get.log(
                                                  "Searched  No Colour Dialogue........... ");
                                              Get.log(
                                                  "Sale Price ${itemDetailsbyIdController.list.data!.salePrice!}");
                                              double saleprice = double.parse(
                                                  itemDetailsbyIdController
                                                      .list.data!.salePrice
                                                      .toString());

                                              Get.log(
                                                  "Sale Price after parsing :${saleprice}");
                                              double newPrice = saleprice +
                                                  (widget.percentage / 100) *
                                                      saleprice;
                                              print("New Price =${newPrice}");
                                              newSalePriceController.text='${newPrice}';
                                              final String colorName = '0';
                                              final String colorUrduName = '0';

                                              // double saleprices = double.parse(
                                              //     singleData.salePrice.toString());

                                              // double newPrice = saleprices +
                                              //                                   //     (widget.percentage / 100) * saleprices;
                                              // print("NewPrice: ${newPrice}");
                                              int rightsvalue=GetStorage().read('RateChange');
                                              Get.log('____rightsvalue is : ${rightsvalue}');


                                              AwesomeDialog(
                                                context: context,
                                                animType: AnimType.scale,
                                                dialogType: DialogType.info,
                                                body: SizedBox(
                                                  height: 350,
                                                  child: ListView.builder(
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      TextEditingController
                                                          quantityController =
                                                          TextEditingController();
                                                      TextEditingController
                                                          itemnoteController =
                                                          TextEditingController();
                                                      return Column(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Row(children: [
                                                      Text('${singleData.itemName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
                                                    ],),
                                                     SizedBox(height: 10,),
                                                    Row(children: [
                                                      Text('${colorName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                                      Expanded(child: SizedBox()),
                                                      Text('${singleData.urduName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
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
                                    controller: quantityController,
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
                                                                // controller
                                                                //     .update();
                                                              },
                                                              controller:
                                                                  itemnoteController,
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
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            15),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          ElevatedButton(
                                                                              onPressed: () async {
                                                                                Get.log('____Color name : ${widget.ColorName}');
                                                                                String scannedColorName = widget.ColorName;
                                                                                int? scannedItemId = singleData.itemID;
                                                                                // Retrieve existing data from local storage
                                                                                List<dynamic>? data = storage.read('myKey');

                                                                                // Check if scanned colorName and itemId already exist in local list
                                                                                int matchingIndex = -1;
                                                                                if (data != null) {
                                                                                  for (int i = 0; i < data.length; i++) {
                                                                                    if (data[i]['colorName'] == scannedColorName && data[i]['itemID'] == scannedItemId) {
                                                                                      matchingIndex = i;
                                                                                      break;
                                                                                    }
                                                                                  }
                                                                                }

                                                                                if (matchingIndex != -1) {
                                                                                  // Show a dialogue asking the user to update the quantity
                                                                                  showDialog(
                                                                                    context: context, // Replace with your UI context
                                                                                    builder: (BuildContext context) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Item Already Exists'),
                                                                                        content: Container(
                                                                                          height: 100,
                                                                                          child: Column(
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
                                                                                              // Close the dialogue without updating the quantity
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            child: Text('No'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                  double quantity = double.parse(quantityController.text.toString());
                                                                                  double grossValue = newPrice * quantity;
                                                                                  Get.log('${grossValue}+++++');
                                                                                  //yesss
                                                                                  Get.log("List Before writing ${GetStorage().read('myKey')}");

                                                                                  List<dynamic> existingData = GetStorage().read<List<dynamic>>('myKey') ?? [];
                                                                                  qRscanController.list2 = List.from(existingData);

                                                                                  // List<dynamic>
                                                                                  //     newList =
                                                                                  //     List.from(
                                                                                  //         existingData);
                                                                                double newsale=double.parse(newSalePriceController.text.toString()) ;
                                                                                 double  newgross= newsale*quantity;
                                                                                  if(rightsvalue==0){
                                                                                    qRscanController.list1 = [
                                                                                    {
                                                                                      'CustomerCode': widget.CustomerCode,
                                                                                      'CustomerName': widget.customerName,
                                                                                      'itemID': singleData.itemID,
                                                                                      'itemName': singleData.itemName,
                                                                                      'urduName': singleData.urduName,
                                                                                      'colorName': widget.ColorName,
                                                                                      'colorID': widget.ColorId,
                                                                                      'salePrice': newPrice,
                                                                                      'qty': int.parse(quantityController.text.toString()),
                                                                                      'itemNote': itemnoteController.text.toString(),
                                                                                      'grossValue': grossValue,
                                                                                    }
                                                                                  ];
                                                                                  }
                                                                                  else{
                                                                                    qRscanController.list1 = [
                                                                                    {
                                                                                      'CustomerCode': widget.CustomerCode,
                                                                                      'CustomerName': widget.customerName,
                                                                                      'itemID': singleData.itemID,
                                                                                      'itemName': singleData.itemName,
                                                                                      'urduName': singleData.urduName,
                                                                                      'colorName': widget.ColorName,
                                                                                      'colorID': widget.ColorId,
                                                                                      'salePrice': newSalePriceController.text,
                                                                                      'qty': int.parse(quantityController.text.toString()),
                                                                                      'itemNote': itemnoteController.text.toString(),
                                                                                      'grossValue': newgross,
                                                                                    }
                                                                                  ];
                                                                                  }
                                                                                  

                                                                                  qRscanController.list2.addAll(qRscanController.list1);

                                                                                  await GetStorage().write('myKey', qRscanController.list2);
                                                                                  qRscanController.update();
                                                                                  Get.log("List after writing abc ${GetStorage().read('myKey')}");
                                                                                  qRscanController.list1.clear();
                                                                                  // qRscanController
                                                                                  //     .list2
                                                                                  //     .clear();

                                                                                  Navigator.of(context).pop();
                                                                                }
                                                                                itemcontroller.searchtext.text='';
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.black, // Change the color here
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                              ),
                                                                              child: Text("Add Item")),
                                                                          SizedBox(
                                                                            width:
                                                                                20,
                                                                          ),
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              style: ElevatedButton.styleFrom(
                                                                                primary: Colors.black, // Change the color here
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                ),
                                                                              ),
                                                                              child: Text("Cancel")),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            ],
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
                                            } else {
                                              Get.log(
                                                  "No Searched Color Found Dialogue ");
                                              //without...........
                                              print(itemcolorcontroller
                                                  .itemColorList!.listdata);
                                              print(itemcolorcontroller
                                                  .itemColorList!
                                                  .listdata![index]
                                                  .colorName);
                                              print("Colour Found");
                                              print(itemcolorcontroller
                                                  .itemColorList!
                                                  .listdata!
                                                  .length);
                                              //choosing color
                                              showCustomBottomSheet(
                                                  context: context,
                                                  ItemId: singleData.itemID!,
                                                  ItemName:
                                                      singleData.itemName!,
                                                  urduName:
                                                      singleData.urduName!);
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      'Urdu Name:${singleData.urduName}'),
                                                  Text(""),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment
                                              //           .spaceBetween,
                                              //   children: [
                                              //     Text(
                                              //         'itemId:${singleData.itemID}'),
                                              //     Text(""),
                                              //   ],
                                              // ),

                                              const SizedBox(
                                                height: 5,
                                              ),

                                              const SizedBox(
                                                height: 5,
                                              ),
                                              //..

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
                  ],
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  void showCustomDialogAfterColor(BuildContext context, String colornamevalue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tapped Value'),
          content: Column(children: [
            Text("Item Id "),
            Text(colornamevalue),
          ]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

//final dialogue
  void showCustomBottomSheet({
    required BuildContext context,
    required int ItemId,
    required String ItemName,
    required String urduName,
  }) {
    showModalBottomSheet(
      context: context,

      isScrollControlled: true, // Allow the bottom sheet to expand vertically
      builder: (BuildContext context) {
        Get.log(
            "Item Id :${ItemId} ItemName :${ItemName}  UrduName : ${urduName}");
        // Get.log(
        //     "Sale Price : ${itemDetailsbyIdController.list.data!.salePrice}");
        return Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height *
              0.8, // Set the desired height
          child: ListView.builder(
            itemCount: itemcolorcontroller.list.listdata!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //colorname
                  widget.colornamevalue =
                      itemcolorcontroller.list.listdata![index].colorName!;
                  widget.ColorId =
                      itemcolorcontroller.list.listdata![index].colorId!;
                  widget.ColorName =
                      itemcolorcontroller.list.listdata![index].colorName!;
                  print("tap value${widget.colornamevalue}");
                  double saleprice = double.parse(itemDetailsbyCodeController
                      .list.data!.salePrice
                      .toString());
                  Get.log("Sale Price after parsing :${saleprice}");
                  double newPrice =
                      saleprice + (widget.percentage / 100) * saleprice;
                  print("New Price =${newPrice}");
                  newSalePriceController.text='${newPrice}';
                  int rightsvalue=GetStorage().read('RateChange');
                  AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.info,
                    body: SizedBox(
                      height: 350,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          TextEditingController quantityController =
                              TextEditingController();
                          TextEditingController itemnoteController =
                              TextEditingController();
                          return Column(
                            children: [
                              Column(
                                children: [
                                  Row(children: [
                                                      Text('${ItemName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
                                                    ],),
                                                     SizedBox(height: 10,),
                                                    Row(children: [
                                                      Text('${widget.colornamevalue}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                                      Expanded(child: SizedBox()),
                                                      Text('${urduName}',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                              
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
                                    controller: quantityController,
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
                                                                // controller
                                                                //     .update();
                                                              },
                                                              controller:
                                                                  itemnoteController,
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
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Row(
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () async{
                                                    final GetStorage storage = GetStorage();
                                                   Get.log('____Color name : ${widget.ColorName}');
                                                   Get.log('______ItemId  :             ${ItemId}');
                                                                                String scannedColorName = widget.ColorName;
                                                                                int? scannedItemId = ItemId;
                                                                                // Retrieve existing data from local storage
                                                                                List<dynamic>? data = storage.read('myKey');

                                                                                // Check if scanned colorName and itemId already exist in local list
                                                                                int matchingIndex = -1;
                                                                                if (data != null) {
                                                                                  for (int i = 0; i < data.length; i++) {
                                                                                    if (data[i]['colorName'] == scannedColorName && data[i]['itemID'] == scannedItemId) {
                                                                                      matchingIndex = i;
                                                                                      break;
                                                                                    }
                                                                                  }
                                                                                }

                                                                                if (matchingIndex != -1) {
                                                                                  // Show a dialogue asking the user to update the quantity
                                                                                  showDialog(
                                                                                    context: context, // Replace with your UI context
                                                                                    builder: (BuildContext context) {
                                                                                      return AlertDialog(
                                                                                        title: Text('Item Already Exists'),
                                                                                        content: Container(
                                                                                          height: 100,
                                                                                          child: Column(
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
                                                                                              // Close the dialogue without updating the quantity
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                            child: Text('No'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                } else {
                                                                                     double quantity =
                                                       
                                                       double.parse(quantityController
                                                                .text
                                                                .toString());     

                                                    double grossValue =
                                                        newPrice * quantity;
                                                    Get.log(
                                                        "Customer :${widget.customerName} ItemId:${ItemId}  ItemName:${ItemName}  urduname${urduName} ColorId${widget.ColorId}  ColorName${widget.ColorName} quantity : ${quantity} SalePrice :${newPrice} GrossValue ${grossValue} ");

                                                    print(
                                                        "Gross Value =${grossValue}");
                                                        double newsale=double.parse(newSalePriceController.text.toString()) ;
                                                                                 double  newgross= newsale*quantity;
                                                    //adding to list2
                                                    if(rightsvalue==0){
                                                      qRscanController.list1 = [
                                                      {
                                                        'CustomerCode':
                                                            widget.CustomerCode,
                                                        'CustomerName':
                                                            widget.customerName,
                                                        'itemID': ItemId,
                                                        'itemName': ItemName,
                                                        'urduName': urduName,
                                                        'colorName':
                                                            widget.ColorName,
                                                        'colorID':
                                                            widget.ColorId,
                                                        'salePrice': newPrice,
                                                        'qty': int.parse(
                                                            quantityController
                                                                .text
                                                                .toString()),
                                                        'itemNote':
                                                            itemnoteController
                                                                .text
                                                                .toString(),
                                                        'grossValue':
                                                            grossValue,
                                                      }
                                                    ];
                                                    }
                                                    else{
                                                      qRscanController.list1 = [
                                                      {
                                                        'CustomerCode':
                                                            widget.CustomerCode,
                                                        'CustomerName':
                                                            widget.customerName,
                                                        'itemID': ItemId,
                                                        'itemName': ItemName,
                                                        'urduName': urduName,
                                                        'colorName':
                                                            widget.ColorName,
                                                        'colorID':
                                                            widget.ColorId,
                                                        'salePrice': newSalePriceController.text,
                                                        'qty': int.parse(
                                                            quantityController
                                                                .text
                                                                .toString()),
                                                        'itemNote':
                                                            itemnoteController
                                                                .text
                                                                .toString(),
                                                        'grossValue':
                                                            newgross,
                                                      }
                                                    ];
                                                    }
                                                    
                                                    print(
                                                        "List 1 : ${qRscanController.list1}");

                                                    qRscanController.list2
                                                        .addAll(qRscanController
                                                            .list1);
                                                    GetStorage().write('myKey',
                                                        qRscanController.list2);
                                                    qRscanController.update();
                                                    qRscanController.list1
                                                        .clear();

                                                    
                                                    Navigator.of(context).pop();
                                                                                }
                                                                                itemcontroller.searchtext.text='';
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .black, // Change the color here
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  child: Text("Add Item")),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors
                                                        .black, // Change the color here
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                  child: Text("Cancel")),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.amber,
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
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${itemcolorcontroller.list.listdata![index].colorName} ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '${itemcolorcontroller.list.listdata![index].colorId} ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
