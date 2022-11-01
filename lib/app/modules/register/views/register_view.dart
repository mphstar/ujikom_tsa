// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_tsa/app/modules/login/controllers/login_controller.dart';
import 'package:tes_tsa/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REGISTER'),
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
                height: 43,
              ),
              Center(
                  child: Image.asset(
                "assets/images/image.png",
                height: 162,
                width: 170,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xff535353),
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
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
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    controller: controller.nameC,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
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
                    controller: controller.usernameC,
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
              Container(
                width: 315,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff0f0f0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    controller: controller.phoneC,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
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
                            controller: controller.passwordC,
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
                    child: Obx(
                      () => TextButton.icon(
                          onPressed: () {
                            controller.changeShowPw();
                          },
                          icon: Icon(
                            controller.isHidePw.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff9f9f9f),
                          ),
                          label: const Text("")),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
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
                    if (controller.usernameC.text == '' &&
                        controller.nameC.text == '' &&
                        controller.passwordC.text == '' &&
                        controller.phoneC.text == '') {
                      Get.snackbar(
                        'Gagal',
                        'Field harus diisi',
                        backgroundColor: Colors.black,
                        colorText: Colors.white,
                      );
                    } else {
                      controller.createItem({
                        "id": controller.getID(),
                        "fullname": controller.nameC.text,
                        "username": controller.usernameC.text,
                        "password": md5
                            .convert(utf8.encode(controller.passwordC.text))
                            .toString(),
                        "phone": controller.phoneC.text,
                      });

                      Get.dialog(AlertDialog(
                        title: Text('Berhasil'),
                        content: Text('Registrasi Berhasil'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.delete<LoginController>();
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ));
                    }
                  },
                  child: const Text(
                    "Register",
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
                    "Already have an account?",
                    style: TextStyle(
                      color: Color(0xff767676),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: const Text(
                      "Login",
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
