import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Content of the screen
        // Add your main content widgets here

        // Loading indicator
        Container(
          color: Colors.black54, // Semi-transparent background color
          child: CircularProgressIndicator(), // Circular progress indicator
        ),
      ],
    );
  }
}
