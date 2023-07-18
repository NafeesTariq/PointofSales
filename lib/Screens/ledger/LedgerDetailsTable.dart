import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:open_file/open_file.dart';
import 'package:quest/controllers/itemDetailsController.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:quest/widgets/customAppbar.dart';

class LedgerDetailsTable extends StatefulWidget {
  const LedgerDetailsTable();

  @override
  State<LedgerDetailsTable> createState() => _LedgerDetailsTableState();
}

class _LedgerDetailsTableState extends State<LedgerDetailsTable> {
  LedgerDetailsController ledgerDetailscontroller =
      Get.find<LedgerDetailsController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ledger Details'),
      // appBar: MyAppBar(title: 'Ledger', center: true),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: Colors.amber),
                child: Text("Download"),
              ),
              ledgerDetailscontroller.ledgerdetailslist!.list!.isEmpty
                  ? const Center(
                      child: Text('No Data Here'),
                    )
                  : SizedBox(
                      //height: 600,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('VoucherNo')),
                            DataColumn(label: Text('VoucherDate')),
                            DataColumn(label: Text('Debit')),
                            DataColumn(label: Text('Credit')),
                            DataColumn(label: Text('Balance')),
                            DataColumn(label: Text('Remarks')),
                          ],
                          rows: ledgerDetailscontroller.ledgerdetailslist!.list!
                              .map<DataRow>((item) {
                            return DataRow(cells: <DataCell>[
                              DataCell(Text(item.voucherNo.toString())),
                              DataCell(Text(item.voucherDateString.toString())),
                              DataCell(Text(item.debit.toString())),
                              DataCell(Text(item.credit.toString())),
                              DataCell(Text(item.balance.toString())),
                              DataCell(Text(item.remarks!.toString())),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
              // InkWell(
              //   onTap: () async {
              //     await generate();
              //   },
              //   child: Container(
              //     height: 40,
              //     width: 100,
              //     decoration: BoxDecoration(color: Colors.amber),
              //     child: Text("Download"),
              //   ),
              // ),

              // CustomButton(
              //   title: 'Download',
              //   function: () async {
              //     await generate();
              //   },
            ])),
      ),
    );
  }

  generate() async {
    final pdf = pw.Document();
    final data = Get.find<LedgerDetailsController>().ledgerdetailslist!.list;
    final chunkedData = List.generate((data!.length / 30).ceil(), (index) {
      final start = index * 30;
      final end = (index + 1) * 30;
      return data.sublist(start, end < data.length ? end : data.length);
    });
    for (final chunk in chunkedData) {
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Table.fromTextArray(
              context: context,
              data: [
                [
                  'VoucherNo',
                  'VoucherDate',
                  'Debit',
                  'Credit',
                  'Balance',
                  'Remarks'
                ],
                ...data!.map((row) => [
                      row.voucherNo! ?? '',
                      row.voucherDateString.toString() ?? '',
                      row.debit.toString() ?? '',
                      row.credit.toString() ?? '',
                      row.balance.toString() ?? '',
                      row.remarks.toString() ?? '',
                    ])
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(),
                // Date column width will be flexible
                1: const pw.FlexColumnWidth(),
                // Computer No column width will be flexible
                2: const pw.FlexColumnWidth(),
                // Debit column width will be flexible
                3: const pw.FlexColumnWidth(),
                // Credit column width will be flexible
                4: const pw.FlexColumnWidth(),
                // Balance column width will be flexible
                5: const pw.FlexColumnWidth(),
                // Remarks column width will be flexible
              },
            );
          },
        ),
      );
    }

    final bytes = await pdf.save();
    final directory = await getExternalStorageDirectory();
    final file = File('${directory!.path}/ledger${DateTime.now().second}.pdf');
    await file.writeAsBytes(bytes);
    Get.log("Path is ${file.path}");
    // CustomSnackBar.successSnackBar(
    //     text: "Success", mess: 'File Downloaded Successfully');

    OpenFile.open(file.path);

    // return a Column widget containing a Row with child Text widgets
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: const [
    //         Text('Date'),
    //         SizedBox(width: 10),
    //         Text('Computer No'),
    //         SizedBox(width: 10),
    //         Text('Debit'),
    //         SizedBox(width: 10),
    //         Text('Credit'),
    //         SizedBox(width: 10),
    //         Text('Balance'),
    //         SizedBox(width: 10),
    //         Text('Remarks'),
    //       ],
    //     ),
    //     ...data!.map((row) => Row(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(row.recordDateString ?? ''),
    //         const SizedBox(width: 10),
    //         Text(row.computerNo ?? ''),
    //         const SizedBox(width: 10),
    //         Text(row.debit.toString() ?? ''),
    //         const SizedBox(width: 10),
    //         Text(row.credit.toString() ?? ''),
    //         const SizedBox(width: 10),
    //         Text(row.balance.toString() ?? ''),
    //         const SizedBox(width: 10),
    //         Text(row.remarks.toString() ?? ''),
    //       ],
    //     ))
    //   ],
    // );
  }
}
