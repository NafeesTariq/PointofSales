import 'package:flutter/material.dart';
import 'package:get/get.dart';

openLoader() {
  Get.dialog(Center(
    child: SizedBox(
      height: 50,
      width: 50,
      child: CircularProgressIndicator(color: Colors.black),
    ),
  ));
}
