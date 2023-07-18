import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quest/APis/api_providers.dart';
import 'package:quest/Screens/login/ForgotPass.dart';
import 'package:quest/controllers/login_auth.dart';
import 'package:quest/utils/utils.dart';

class SiginIn extends StatelessWidget {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Api_Provider api_provider = Api_Provider();
  LoginController loginController = Get.put(LoginController());
  SiginIn({Key? key}) : super(key: key);
  googleLogin() async {
    print("Login method called");
  }

  // Future<void> logout() async {
  //   print("object");
  // }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Exit the app
        return true;
      },
      child: Scaffold(
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
                      height: 220,
                      padding: EdgeInsets.all(20),
                      color: Colors.black,
                      alignment: Alignment.center,
                      child: Image.asset('assets/images/launcher_icon.png'),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 20, right: 270),
                    child: Text(
                      "Sign In",
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
                        controller: _emailController,
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          hintText: "Email",
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
                            controller: _passwordController,
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
                              hintText: "Password",
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
                          "Sign In",
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
                          if (_emailController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter email', context);
                          } else if (_passwordController.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please enter password', context);
                          } else if (_passwordController.text.length < 5) {
                            Utils.flushBarErrorMessage(
                                'Please enter 6 digit password', context);
                          } else {
                            // api_provider.loginAPI(

                            loginController.login(
                                _emailController.text.toString(),
                                _passwordController.text.toString(),
                                context);
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
                      InkWell(
                        onTap: () {
                          Get.to(() => ChangePassword());
                        },
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
