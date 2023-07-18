import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Percentage'),
      content: TextField(
        controller: _textController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          hintText: 'Enter percentage',
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('OK'),
          onPressed: () {
            // Convert the entered value to a double
            final enteredValue = double.tryParse(_textController.text.trim());

            // Check if the entered value is valid
            if (enteredValue != null &&
                enteredValue >= 0 &&
                enteredValue <= 100) {
              // Return the entered value to the calling screen
              Navigator.of(context).pop(enteredValue);
            } else {
              // Show an error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Please enter a valid percentage value.')),
              );
            }
          },
        ),
      ],
    );
  }
}
