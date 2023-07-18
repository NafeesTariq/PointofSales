import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/controllers/ChangepasswordController.dart';
import 'package:quest/controllers/login_auth.dart';
import 'package:quest/utils/utils.dart';

class ChangePassword extends StatelessWidget {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController salesmanIDController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();
  Api_Provider api_provider = Api_Provider();
  ChangepasswordController changepasswordController =
      Get.put(ChangepasswordController());

  ChangePassword({Key? key}) : super(key: key);
  googleLogin() async {
    print("Login method called");
  }

  Future<void> logout() async {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    int salesmanid = int.parse(GetStorage().read('SalesmanId').toString());
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(
                    flip: true,
                  ),
                  child: Container(
                    height: 230,
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20, right: 130),
                  child: Text(
                    "Change Password ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Inter",
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 32, top: 16),
                  child: Container(
                    height: 48,
                    width: 315,
                    child: TextField(
                      controller: salesmanIDController,
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.alternate_email),
                        hintText: "Salesman ID",
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Color(0xFFE6E6E6),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 32, top: 16),
                  child: Container(
                    height: 48,
                    width: 315,
                    child: ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: (context, value, child) {
                        return TextField(
                          obscureText: _obsecurePassword.value,
                          obscuringCharacter: "*",
                          controller: oldpasswordController,
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open_rounded),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(_obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            hintText: "Old Password",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color(0xFFE6E6E6),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 32, top: 16),
                  child: Container(
                    height: 48,
                    width: 315,
                    child: ValueListenableBuilder(
                      valueListenable: _obsecurePassword,
                      builder: (context, value, child) {
                        return TextField(
                          obscureText: _obsecurePassword.value,
                          obscuringCharacter: "*",
                          controller: newpasswordController,
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open_rounded),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: Icon(_obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility)),
                            hintText: "Set New  Password",
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Color(0xFFE6E6E6),
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 83, right: 76),
                  child: Container(
                    height: 50,
                    width: 216,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      child: Text(
                        "Change Password ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (salesmanIDController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter email', context);
                        } else if (oldpasswordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter password', context);
                        } else if (oldpasswordController.text.length < 5) {
                          Utils.flushBarErrorMessage(
                              'Please enter 6 digit password', context);
                        } else {
                          // api_provider.loginAPI(

                          changepasswordController.Changepassword(
                              SalesmanID: salesmanid,
                              newpassword: newpasswordController.text,
                              oldpassword: oldpasswordController.text);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Color(0xFF475569),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
