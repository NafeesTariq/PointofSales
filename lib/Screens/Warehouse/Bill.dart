import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/controllers/SavetoretransferController.dart';
import 'package:quest/controllers/WarehouseListCOntroller.dart';

class WarehouseBill extends StatefulWidget {
  final String fromstore;
  final String tostore;
  final String itemNote;
  final int fromstoreid;
  final int tostoreid;

  // final double grossTotal;

  WarehouseBill({
    super.key,
    // required this.grossTotal,
    required this.itemNote,
    required this.fromstore,
    required this.tostore,
    required this.fromstoreid,
    required this.tostoreid,
  });

  SaveStoreTransferController saveStoreTransferController =
      Get.put(SaveStoreTransferController());
  TextEditingController RemarksController = TextEditingController();
  TextEditingController refferenceController = TextEditingController();

  @override
  State<WarehouseBill> createState() => _WarehouseBillState();
}

class _WarehouseBillState extends State<WarehouseBill> {
  @override
  Widget build(BuildContext context) {
    // int salesmanid = int.parse(GetStorage().read('salesmanId'));
    Get.log('-----${GetStorage().read('SalesmanId')}----');
    // Get.log("POercentage is ${widget.percentage}");
    // Get.log(
    //     "customer Type:${widget.customertype}   Customer Name :${widget.customerName} Customer Code:${widget.customerCode} Gross Total ${widget.grossTotal} Percentage:${widget.percentage}");

    String computerNo = '';
    int invoiceType;
    int detailCode;
    String cashCustomerName;
    int exchangeRate = 0;
    final GetStorage storage = GetStorage();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                height: 70,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      child: Center(
                          child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Text(
                            "From : ${widget.fromstore}",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ),
                    Text(
                      "To      : ${widget.tostore}",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, right: 10, left: 10, bottom: 0),
              child: Container(
                height: 425,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: storage.read('myKey2') == null
                    ? Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 10, right: 10, left: 10),
                        child: Container(
                          height: 500,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 10, right: 15, left: 15),
                        child: SizedBox(
                          height: 450,
                          child: ListView.builder(
                            itemCount: GetStorage().read('myKey2').length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(20),
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
                                          //scanned
                                          // Text(
                                          //   'Item Id  ${GetStorage().read('myKey')[index]['itemID']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),

                                          //------->>>>>>>>>>>>>>>>>>----------------

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
                                            '${GetStorage().read('myKey2')[index]['itemName']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${GetStorage().read('myKey2')[index]['urduName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Color Name         ${GetStorage().read('myKey2')[index]['colorName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          // Text(
                                          //   'Sale Price       :    ${GetStorage().read('myKey')[index]['salePrice']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          Text(
                                            'Quantity               ${GetStorage().read('myKey2')[index]['qty']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Item Note             ${GetStorage().read('myKey2')[index]['itemNote']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          // Text(
                                          //   'Gross Value   :     ${GetStorage().read('myKey')[index]['grossValue']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          // Text(
                                          //   'ColorId :${GetStorage().read('myKey')[index]['colorID']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          // Text(
                                          //   'ColorName :${GetStorage().read('myKey')[index]['colorName']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),

                                          // Text(
                                          //   'Quantity ${GetStorage().read('myKey')[index]['qty']}',
                                          //   // 'Sale Price =${controller.list1[index]['data']['salePrice']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                          // Text(
                                          //   ' Gross Value  ${GetStorage().read('myKey')[index]['grossValue']}',
                                          //   // 'Sale Price =${controller.list1[index]['data']['salePrice']}',
                                          //   style: TextStyle(
                                          //       fontSize: 16,
                                          //       fontWeight: FontWeight.w600),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ),
            Container(
              // decoration: BoxDecoration(color: Colors.red),
              height: 148,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(color: Colors.red),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: TextFormField(
                      controller: widget.RemarksController,
                      maxLines: 1,
                      decoration: InputDecoration(
                        labelText: 'Remarks',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: TextFormField(
                      controller: widget.refferenceController,
                      decoration: InputDecoration(
                        labelText: 'Refference No',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: InkWell(
                onTap: () {
                  // final GetStorage storage = GetStorage();
                  // List<dynamic>? data = storage.read('myKey');
                  // Get.log("My Data Now  ${data! ?? 'NO dATA'}");
                  List<Map<String, dynamic>> InvoiceDetails =
                      GetInvoiceDetails();
                  Get.log("Invoice Details : ${InvoiceDetails}");

                  Get.log('Id is ${GetStorage().read('SalesmanId')}');

                  widget.saveStoreTransferController.SaveStoreTransfer(
                      fromstoreid: widget.fromstoreid,
                      tostoreid: widget.tostoreid,
                      ReferenceNo: widget.refferenceController.text,
                      remarks: widget.RemarksController.text,
                      userID: GetStorage().read('SalesmanId'),
                      invoiceDetail: InvoiceDetails);

                  Get.log('okkkkkk');

                  // Get.log(
                  //     "Check Info......... computerNo : ${computerNo} 'invoiceType' :${invoiceType}   'detailCode' ${detailCode} 'cashCustomerName':${cashCustomerName} 'exchangeRate': ${exchangeRate} remarks:${widget.RemarksController.text.toString()} grossTotal:${widget.grossTotal} invoiceDetail:${InvoiceDetails}");
                  // widget.SaveStoreTransferController.SaveShopAPI(
                  //     computerNo: computerNo,
                  //     // invoiceType: invoiceType,
                  //     // detailCode: widget.customerCode,
                  //     // cashCustomerName: cashCustomerName,
                  //     // exchangeRate: widget.percentage,
                  //     remarks: widget.RemarksController.text.toString(),
                  //     grossTotal: widget.grossTotal,
                  //     invoiceDetail: InvoiceDetails);
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> GetInvoiceDetails() {
    List<dynamic> getStorageData = GetStorage().read('myKey2') ?? [];

    List<Map<String, dynamic>> finalList = [];

    for (var data in getStorageData.cast<Map<String, dynamic>>()) {
      Map<String, dynamic> newData = {
        'itemID': data['itemID'],
        'itemName': data['itemName'],
        'urduName': data['urduName'],
        'colorName': data['colorName'],
        // 'colorID': data['colorID'],
        'qty': data['qty'],
        'itemNote': data['itemNote'],
        // Add your additional value here
        // Add your additional value here
      };

      finalList.add(newData);
    }

    return finalList;
  }
}
