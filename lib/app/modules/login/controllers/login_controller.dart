// ignore_for_file: unused_field, prefer_final_fields, unnecessary_overrides, no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_tsa/app/modules/home/controllers/home_controller.dart';

class LoginController extends GetxController {
  // ignore: todo
  //TODO: Implement LoginController

  final count = 0.obs;
  final isHidePw = true.obs;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  List<Map<String, dynamic>> _listAccount = [];
  final _account = Hive.box('account');

  void changeShowPw() => isHidePw.value = !isHidePw.value;

  Future<void> setIntoSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("statusLogin", 'true');
    await prefs.setString("username", usernameController.text);
    await prefs.setString("password", passwordController.text);
    await prefs.setString("name", getNameFromUsername(usernameController.text));
  }

  String getNameFromUsername(var username) {
    for (var i = 0; i < _listAccount.length; i++) {
      final _currentAccount = _listAccount[i];
      if (username == _currentAccount['username']) {
        return _currentAccount['fullname'];
      }
    }
    return '';
  }

  bool checkAccount(String email, String pw) {
    for (var i = 0; i < _listAccount.length; i++) {
      final _currentAccount = _listAccount[i];
      if (email == _currentAccount['username'] &&
          md5.convert(utf8.encode(pw)).toString() == _currentAccount['password']) {
        return true;
      }
    }
    return false;
  }

  var statusLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
     SharedPreferences.getInstance().then((prefValue) => {
          prefValue.getString("statusLogin") == 'true'
              ? statusLogin.value = true
              : statusLogin.value = false
        });
        
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

    _listAccount = data.toList();
    update();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<HomeController>();
  }

  void increment() => count.value++;
}
