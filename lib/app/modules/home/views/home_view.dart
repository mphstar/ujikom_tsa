// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last, invalid_use_of_protected_member, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tes_tsa/app/modules/home/views/dashboard.dart';
import 'package:tes_tsa/app/modules/home/views/profile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: Icon(Icons.refresh),
            onPressed: () {
              controller.refreshState();
            },
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottomOpacity: 0,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 53,
                        height: 53,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          image: DecorationImage(
                              image: AssetImage('assets/images/pic8.jpg'),
                              fit: BoxFit.cover),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(53, 53)),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good Afternoon'),
                          Obx(
                            () => Text(
                              '${controller.nama.value.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD43232),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        title: Text('Logout'),
                        content: Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () => controller.logout(),
                            child: Text('OK'),
                          ),
                        ],
                      ));
                    },
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  isScrollable: true,
                  mouseCursor: MouseCursor.uncontrolled,
                  padding: EdgeInsets.only(top: 30),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  physics: ClampingScrollPhysics(),
                  tabs: [
                    SizedBox(
                      height: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Dashboard'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Profile'),
                      ),
                    ),
                  ],
                  controller: controller.controller,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.controller,
                children: [
                  dashBoard(),
                  profilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
