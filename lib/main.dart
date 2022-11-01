// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tes_tsa/app/controllers/_controller.dart';
import 'package:tes_tsa/app/modules/home/controllers/home_controller.dart';
import 'package:tes_tsa/app/modules/home/views/home_view.dart';
import 'package:tes_tsa/app/modules/login/controllers/login_controller.dart';
import 'package:tes_tsa/app/modules/login/views/login_view.dart';

import 'app/routes/app_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('account');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(Controller());
  final a = Get.put(HomeController());
  final b = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TSA Ujikom",
        home: a.statusLogin.value ? HomeView() : LoginView(),
        getPages: AppPages.routes,
      ),
    );
  }
}
