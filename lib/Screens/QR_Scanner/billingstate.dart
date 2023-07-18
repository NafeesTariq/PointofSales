import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/Screens/DashBoard/DB5.dart';
import 'package:quest/utils/utils.dart';

import '../../controllers/SaveShopController.dart';

class Bill extends StatefulWidget {
  final String customerUrduName;
  final int customerCode;
  final String itemNote;
  final String customertype;
  final String customerName;
  final int percentage;
  final double grossTotal;

  Bill(
      {super.key,
      required this.customertype,
      required this.customerName,
      required this.grossTotal,
      required this.percentage,
      required this.customerCode,
      required this.itemNote,
      required this.customerUrduName});

  SaveShopController saveShopController = Get.put(SaveShopController());
  TextEditingController RemarksController = TextEditingController();
  TextEditingController refferenceController = TextEditingController();

  @override
  State<Bill> createState() => _BillState();
}

class _BillState extends State<Bill> {
  @override
  Widget build(BuildContext context) {
    Get.log("POercentage is ${widget.percentage}");
    Get.log(
        "customer Type:${widget.customertype}   Customer Name :${widget.customerName} Customer Code:${widget.customerCode} Gross Total ${widget.grossTotal} Percentage:${widget.percentage}");
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
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 30,
                      child: ListTile(
                        title: Center(
                          child: Text(
                            '${widget.customerName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                        trailing: Text(
                          '${widget.customertype}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Text(
                      "${widget.customerUrduName} ",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 10, left: 10, bottom: 25),
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    // color: Colors.blueGrey,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: storage.read('myKey') == null
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
                            itemCount: GetStorage().read('myKey').length,
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
                                            '${GetStorage().read('myKey')[index]['itemName']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${GetStorage().read('myKey')[index]['urduName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Color Name    :   ${GetStorage().read('myKey')[index]['colorName']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Sale Price       :    ${GetStorage().read('myKey')[index]['salePrice']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Quantity          :    ${GetStorage().read('myKey')[index]['qty']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Item Note       :     ${GetStorage().read('myKey')[index]['itemNote']}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            'Gross Value   :     ${GetStorage().read('myKey')[index]['grossValue']}',
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
              height: 200,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(color: Colors.red),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Total Amount   ",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.grossTotal}   ",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
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
                        const EdgeInsets.only(left: 15, right: 20, top: 10),
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
                onTap: () async {
                  // final GetStorage storage = GetStorage();
                  // List<dynamic>? data = storage.read('myKey');
                  // Get.log("My Data Now  ${data! ?? 'NO dATA'}");
                  List<Map<String, dynamic>> InvoiceDetails =
                      GetInvoiceDetails();
                  Get.log("Invoice Details : ${InvoiceDetails}");

                  if (widget.customertype == 'CASH') {
                    invoiceType = 0;
                    detailCode = 0;
                    cashCustomerName = widget.customerName;
                  } else {
                    invoiceType = 1;
                    detailCode = 1;
                    cashCustomerName = '';
                  }
                  Get.log(
                      "Check Info......... computerNo : ${computerNo} 'invoiceType' :${invoiceType}   'detailCode' ${detailCode} 'cashCustomerName':${cashCustomerName} 'exchangeRate': ${exchangeRate} remarks:${widget.RemarksController.text.toString()} grossTotal:${widget.grossTotal} invoiceDetail:${InvoiceDetails}");
                  await widget.saveShopController.SaveShopAPI(
                      computerNo: computerNo,
                      invoiceType: invoiceType,
                      detailCode: widget.customerCode,
                      cashCustomerName: cashCustomerName,
                      exchangeRate: widget.percentage,
                      remarks: widget.RemarksController.text.toString(),
                      grossTotal: widget.grossTotal,
                      invoiceDetail: InvoiceDetails);
                  Utils.flushBarSuccessMessage(
                      'Submitted Successfully', context);
                  GetStorage().remove('myKey');
                  Get.to(() => Dashboard4(
                      fullname: GetStorage().read('fullname'),
                      SalesmanID: GetStorage().read('SalesmanId')));
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
    List<dynamic> getStorageData = GetStorage().read('myKey') ?? [];

    List<Map<String, dynamic>> finalList = [];
    String discountType = '%';
    int discount = 0;
    int uomId = 0;

    for (var data in getStorageData.cast<Map<String, dynamic>>()) {
      Map<String, dynamic> newData = {
        'itemID': data['itemID'],
        'uomId': uomId,
        'qty': data['qty'],
        'rate': data['salePrice'],
        'discountType': discountType,
        'discount': discount,
        'grossValue': data['grossValue'],
        'colorId': data['colorID'],
        'itemNote': data['itemNote'],
        // Add your additional value here
        // Add your additional value here
      };

      finalList.add(newData);
    }

    return finalList;
  }
}
