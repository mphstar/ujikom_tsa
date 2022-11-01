// ignore_for_file: unnecessary_overrides, prefer_final_fields, prefer_const_constructors

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_tsa/app/routes/app_pages.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // ignore: todo
  //TODO: Implement HomeController

  var nama = ''.obs;
  var statusLogin = false.obs;

  late TabController controller;

  var textC = TextEditingController();
  RxList items = <dynamic>[].obs;

  var _listAccount = Hive.box('account');

  var location = 'Belum mendapatkan Lat dan long, Silahkan tekan button'.obs;
  var address = 'Mencari lokasi...'.obs;

  void openMap() {
    final intent = AndroidIntent(
      action: 'action_view',
      data: Uri.encodeFull('google.navigation:q=${textC.text}&avoid=tf'),
      package: 'com.google.android.apps.maps',
    );
    intent.launch();
  }

  Future<void> setIntoSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("statusLogin", 'false');
    await prefs.setString("username", "");
    await prefs.setString("password", "");
    await prefs.setString("name", '');
  }

  void logout() {
    setIntoSharedPreference();
    Get.offAllNamed(Routes.LOGIN);
  }

  void deleteAllData() {
    _listAccount.deleteFromDisk();
  }

  var idC = TextEditingController();
  var userC = TextEditingController();
  var namaC = TextEditingController();
  var pwC = TextEditingController();
  var phoneC = TextEditingController();

  void showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
          items.firstWhere((element) => element['key'] == itemKey);

      idC.text = existingItem['id'];
      userC.text = existingItem['username'];
      namaC.text = existingItem['fullname'];
      pwC.text = existingItem['password'];
      phoneC.text = existingItem['phone'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: namaC,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: 'Nama'),
                  ),
                  TextField(
                    controller: userC,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  TextField(
                    controller: phoneC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Phone'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // update an existing item
                      if (itemKey != null) {
                        _updateItem(itemKey, {
                          'id': idC.text.trim(),
                          'fullname': namaC.text.trim(),
                          'username': userC.text.trim(),
                          'password': pwC.text.trim(),
                          'phone': phoneC.text.trim(),
                        });
                      }

                      // Clear the text fields
                      idC.text = '';
                      namaC.text = '';
                      userC.text = '';
                      pwC.text = '';
                      phoneC.text = '';
                      Get.back();
                    },
                    child: Text('Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _listAccount.put(itemKey, item);
    refreshState(); // Update the UI
  }

  Future<void> deleteItem(int itemKey) async {
    await _listAccount.delete(itemKey);
    refreshState(); // update the UI

    Get.snackbar(
      'Berhasil',
      'An item has been deleted',
      colorText: Colors.white,
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.TOP,
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service belum aktif');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission ditolak');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission ditolak, gagal request permission');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    address.value =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}. ${place.country}';
    update();
  }

  void refreshState() async {
    final data = _listAccount.keys.map((key) {
      final value = _listAccount.get(key);
      return {
        "key": key,
        "id": value['id'],
        "fullname": value["fullname"],
        "username": value["username"],
        "password": value["password"],
        "phone": value["phone"],
      };
    }).toList();

    items.value = data.toList();
    try {
      Position pos = await _determinePosition();
      location.value = '${pos.latitude}, ${pos.longitude}';
      getAddressFromLongLat(pos);
    } catch (e) {
      Get.dialog(AlertDialog(
        title: Text('Gagal'),
        content: Text('Gagal mendapatkan lokasi'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ));
    }
    update();
  }

  void getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nama.value = prefs.getString('name').toString();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    SharedPreferences.getInstance().then((prefValue) => {
          prefValue.getString("statusLogin") == 'true'
              ? statusLogin.value = true
              : statusLogin.value = false
        });

    refreshState();
    controller = TabController(vsync: this, length: 2);
    getPreference();
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
