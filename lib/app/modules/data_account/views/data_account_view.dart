// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/data_account_controller.dart';

class DataAccountView extends StatefulWidget {
  @override
  State<DataAccountView> createState() => _DataAccountViewState();
}

class _DataAccountViewState extends State<DataAccountView> {
  final controller = Get.find<DataAccountController>();

  List<Map<String, dynamic>> items = [];

  var _listAccount = Hive.box('account');

  final count = 0.obs;

  void refreshState() {
    final data = _listAccount.keys.map((key) {
      final value = _listAccount.get(key);
      return {
        "id": value['id'],
        "fullname": value["fullname"],
        "username": value["username"],
        "password": value["password"],
        "phone": value["phone"],
      };
    }).toList();

    setState(() {
      items = data.toList();
    });

  }

  @override
  void initState() {
  
    super.initState();
    refreshState();
  }

  @override
  Widget build(BuildContext context) {
    refreshState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataAccountView'),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? const Center(
              child: Text(
                'No Data',
                style: TextStyle(fontSize: 30),
              ),
            )
          : ListView.builder(
              // the list of items
              itemCount: items.length,
              itemBuilder: (_, index) {
                final currentItem = items[index];
                return Card(
                  color: Colors.orange.shade100,
                  margin: const EdgeInsets.all(10),
                  elevation: 3,
                  child: ListTile(
                    title: Text(currentItem['fullname']),
                    subtitle: Text(currentItem['username'].toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Edit button
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              //_showForm(context, currentItem['key'])),
                              // Delete button
                              IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        title: Text('Hapus Data'),
                                        content: Text(
                                            'Apakah anda yakin ingin menghapus data ${currentItem['name']}'),
                                        actions: [
                                          TextButton(
                                              onPressed: () => Get.back(),
                                              child: Text('Batal')),
                                          TextButton(
                                              onPressed: () {
                                                //_deleteItem(currentItem['key']);
                                                Get.back();
                                              },
                                              child: Text('OK')),
                                        ],
                                      ),
                                    );
                                  }),
                        ),
                      ],
                    ),
                  ),
                );
              }),
      // Add new item button
    );
  }
}
