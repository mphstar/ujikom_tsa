// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_tsa/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        width: (MediaQuery.of(context).size.width),
        height: (MediaQuery.of(context).size.height),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 63,
              ),
              Center(child: Image.asset("assets/images/image.png")),
              const SizedBox(
                height: 43,
              ),
              const Text(
                "Sign In",
                style: TextStyle(
                  color: Color(0xff535353),
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text(
                  "Please enter the details below a continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8d7c7c),
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: 315,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff0f0f0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    controller: controller.usernameController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
                      width: 315,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xfff0f0f0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 50, 0),
                        child: Obx(
                          () => TextField(
                            obscureText: controller.isHidePw.value,
                            controller: controller.passwordController,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(280, 0, 10, 5),
                    child: TextButton.icon(
                        onPressed: () {
                          controller.changeShowPw();
                        },
                        icon: Obx(
                          () => Icon(
                            controller.isHidePw.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff9f9f9f),
                          ),
                        ),
                        label: const Text("")),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) - 680,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                width: Get.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffee4848),
                ),
                child: TextButton(
                  onPressed: () {
                    if (controller.checkAccount(
                        controller.usernameController.text,
                        controller.passwordController.text)) {
                      controller.setIntoSharedPreference();
                      Get.dialog(AlertDialog(
                        title: Text('Berhasil'),
                        content: Text('Login Berhasil'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.delete<LoginController>();
                              Get.offAllNamed(Routes.HOME);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ));
                    } else {
                      Get.dialog(AlertDialog(
                        title: Text('Gagal'),
                        content: Text('Login Gagal'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('OK'),
                          ),
                        ],
                      ));
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Dont have an account?",
                    style: TextStyle(
                      color: Color(0xff767676),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xffEE4848),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
