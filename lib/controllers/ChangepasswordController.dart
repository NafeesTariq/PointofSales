import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/models/ChangePasswordModel.dart';
import 'package:quest/utils/utils.dart';

class ChangepasswordController extends GetxController {
  ChangePasswordModel? changePasswordModelstatus;
  Api_Provider api_provider = Api_Provider();
  Changepassword(
      {required int SalesmanID,
      required String oldpassword,
      required String newpassword,
      context}) {
    api_provider
        .changepass(
            SalesmanID: SalesmanID,
            oldpassword: oldpassword,
            newpassword: newpassword)
        .then((value) {
      changePasswordModelstatus = value;
      Get.log('${changePasswordModelstatus!.message}');
    }).onError((error, stackTrace) {
      // Utils.flushBarErrorMessage('Technical Error', context);
    });
  }
}
