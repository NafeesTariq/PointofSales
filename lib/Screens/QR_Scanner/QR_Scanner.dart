import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QR_Scanner extends StatefulWidget {
  const QR_Scanner({super.key});

  @override
  State<QR_Scanner> createState() => _QR_ScannerState();
}

class _QR_ScannerState extends State<QR_Scanner> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode? result;
  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      setState(() {
        result = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // GetStorage().erase();
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 250,
          width: 250,
          child: QRView(key: _globalKey, onQRViewCreated: qr),
        ),
        Center(
          child: (result != null)
              ? Text(" Link is ${result!.code}")
              : Text('Scan a Code'),
        ),
      ]),
    );
  }
}
