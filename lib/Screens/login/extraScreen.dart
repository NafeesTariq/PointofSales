import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_auth.dart';

class ExtraloginScreen extends StatefulWidget {
  const ExtraloginScreen({super.key});

  @override
  State<ExtraloginScreen> createState() => _ExtraloginScreenState();
}

class _ExtraloginScreenState extends State<ExtraloginScreen> {
  LoginController _loginController =
      Get.put<LoginController>(LoginController());
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Extra Login Screen'),
      ),
      body: Column(children: [
        TextFormField(
          minLines: 2,
          controller: _emailcontroller,
        ),
        TextFormField(
          minLines: 2,
          controller: _passcontroller,
        ),
        InkWell(
          onTap: () {
            _loginController.login(
                _emailcontroller.text, _passcontroller.text, context);
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text('Sign IN'),
            ),
          ),
        )
      ]),
    );
  }
}
