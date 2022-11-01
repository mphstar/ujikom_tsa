// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_tsa/app/modules/home/controllers/home_controller.dart';

class profilePage extends StatelessWidget {
  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
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
                        margin:
                            const EdgeInsets.only(left: 30, right: 30, top: 30),
                        elevation: 3,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 250,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ID                  : ${currentItem['id']}',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text(
                                        'Nama           : ${currentItem['fullname']}',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text(
                                        'Username    : ${currentItem['username']}',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text(
                                        'Password    : ${currentItem['password']}',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text(
                                        'Phone          : ${currentItem['phone']}',
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        controller.showForm(
                                            context, currentItem['key']);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        Get.dialog(AlertDialog(
                                          title: Text('Hapus Data'),
                                          content: Text(
                                              'Apakah anda yakin ingin menghapus data ${currentItem['username']}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Get.back(),
                                              child: Text('Batal'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                                controller.deleteItem(
                                                    currentItem['key']);
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
                              borderRadius: BorderRadius.circular(8),
                              color: Color.fromARGB(255, 231, 231, 231)),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
