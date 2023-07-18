import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeDialog extends StatelessWidget {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();

  DateTime? selectedFromDate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Date Range'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: fromDateController,
            onTap: () async {
              selectedFromDate = await showDatePicker(
                context: context,
                initialDate: selectedFromDate ?? DateTime(2000, 01, 01),
                firstDate: DateTime(2000, 01, 01),
                lastDate: DateTime(2030, 01, 01),
              );

              if (selectedFromDate != null) {
                final formattedDate =
                    DateFormat('yyyy-MM-dd').format(selectedFromDate!);
                fromDateController.text = formattedDate;

                print('...........${selectedFromDate}');
              }
            },
            decoration: InputDecoration(
              labelText: 'From Date',
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
          TextField(
            controller: toDateController,
            onTap: () async {
              DateTime? toDate = await showDatePicker(
                context: context,
                initialDate: selectedFromDate ?? DateTime(2030, 01, 01),
                firstDate: DateTime(2000, 01, 01),
                lastDate: DateTime(2030, 01, 01),
              );

              if (toDate != null) {
                final formattedDate = DateFormat('yyyy-MM-dd').format(toDate);
                toDateController.text = formattedDate;
              }
            },
            decoration: InputDecoration(
              labelText: 'To Date',
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
        ],
      ),
      actions: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop({
                'fromDate': fromDateController.text,
                'toDate': toDateController.text,
              });
            },
            child: Container(
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: Center(child: Text("Ok")),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
