// ignore_for_file: unused_field, prefer_final_fields, unnecessary_overrides, unused_element, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tes_tsa/app/modules/login/controllers/login_controller.dart';

class RegisterController extends GetxController {
  // ignore: todo
  //TODO: Implement RegisterController

  final count = 0.obs;

  var isHidePw = true.obs;

  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

  List<Map<String, dynamic>> listAccount = [];

  final _account = Hive.box('account');

  Future<void> createItem(Map<String, dynamic> newItem) async {
    await _account.add(newItem);
  }

  void changeShowPw() => isHidePw.value = !isHidePw.value;

  String getID() {
    if (listAccount.isEmpty) {
      return '#US10001';
    } else {
      return '#US1000${listAccount.length + 1}';
    }
  }

  @override
  void onInit() {
    super.onInit();
    final data = _account.keys.map((key) {
      final value = _account.get(key);
      return {
        "key": key,
        "id": value['id'],
        "fullname": value["fullname"],
        "username": value["username"],
        "password": value["password"],
        "phone": value["phone"],
      };
    }).toList();

    listAccount = data.toList();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    Get.put<LoginController>;
  }

  void increment() => count.value++;
}
