// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last, invalid_use_of_protected_member, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'WELCOME',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              'Koordinat',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Obx(
                              () => Expanded(
                                child: Text(
                                  '${controller.location.value}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              'Alamat',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Obx(
                              () => Expanded(
                                child: Text(
                                  '${controller.address.value}',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              'Cari Alamat',
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfff0f0f0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                          child: TextField(
                            controller: controller.textC,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Cari Tujuan Alamat',
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
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        height: 40,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            controller.openMap();
                          },
                          child: Text(
                            'Cari',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => Column(
                      children: [
                        controller.items.isEmpty
                            ? Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'No Data',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  // the list of items
                                  itemCount: controller.items.value.length,
                                  itemBuilder: (_, index) {
                                    final currentItem = controller.items[index];
                                    return Card(
                                      color: Color.fromARGB(255, 236, 236, 236),
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 30, top: 30),
                                      elevation: 3,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                            vertical: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 250,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ID                  : ${currentItem['id']}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                    Text(
                                                      'Username    : ${currentItem['username']}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                    Text(
                                                      'Nama           : ${currentItem['fullname']}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                    Text(
                                                      'Password    : ${currentItem['password']}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                    Text(
                                                      'Phone          : ${currentItem['phone']}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  IconButton(
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    onPressed: () {
                                                      controller.showForm(
                                                          context,
                                                          currentItem['key']);
                                                    },
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    onPressed: () {
                                                      Get.dialog(AlertDialog(
                                                        title:
                                                            Text('Hapus Data'),
                                                        content: Text(
                                                            'Apakah anda yakin ingin menghapus data ${currentItem['username']}'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Get.back(),
                                                            child:
                                                                Text('Batal'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                              controller.deleteItem(
                                                                  currentItem[
                                                                      'key']);
                                                            },
                                                            child: Text('OK'),
                                                          ),
                                                        ],
                                                      ));
                                                    },
                                                  ),
                                                ],
                                              ),
                                              // Delete button
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: Color.fromARGB(
                                                255, 231, 231, 231)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
