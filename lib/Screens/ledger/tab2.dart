import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quest/models/LedgerDetailsModel.dart';
import 'package:quest/widgets/customAppbar.dart';

import '../../controllers/itemDetailsController.dart';

class LedgerDetailsModel {
  final String voucherNo;
  final String date;
  final double credit;
  final double debit;
  // Add additional fields here

  LedgerDetailsModel({
    required this.voucherNo,
    required this.date,
    required this.credit,
    required this.debit,
    // Initialize additional fields here
  });
}

class TabularDataScreen extends StatelessWidget {
  final List<ListElement>? data;

  TabularDataScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Ledger Report',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: InkWell(
              onTap: () {
                generate();
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Download',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: <DataColumn>[
                DataColumn(label: Text('Voucher No.')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Credit')),
                DataColumn(label: Text('Debit')),
                DataColumn(label: Text('Balance')),
                DataColumn(label: Text('Remarks')),
                // Add additional columns here
              ],
              rows: List<DataRow>.generate(
                data!.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(data![index].voucherNo.toString())),
                    DataCell(Text(data![index].voucherDateString.toString())),
                    DataCell(Text(data![index].credit.toString())),
                    DataCell(Text(data![index].debit.toString())),
                    DataCell(Text(data![index].balance.toString())),
                    DataCell(Text(data![index].remarks.toString())),
                    // Add additional cells here
                  ],
                ),
              ),
            ),
          ),
        ],
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
                ['VoucherNo', 'Date', 'Credit', 'Debit', 'Balance', 'Remarks'],
                ...data!.map((row) => [
                      row.voucherNo! ?? '',
                      row.voucherDateString.toString() ?? '',
                      row.credit.toString() ?? '',
                      row.debit.toString() ?? '',
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
