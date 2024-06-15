// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeldetail.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeljamkeluar.dart';

class DetailAbsenController extends GetxController {
  FirebaseFirestore rs = FirebaseFirestore.instance;

  List<DetailJamMasuk> data = [];

  List<DetailJamKeluar> datakeluar = [];

  RxBool status = false.obs;

  getdetail() async {
    try {
      final jamMasuk = await rs.collection("jam_masuk").get();

      if (jamMasuk.docs.isNotEmpty) {
        print(jamMasuk.docs);

        jamMasuk.docs.map((e) {
          DetailJamMasuk listjamMasuk =
              DetailJamMasuk.fromJson(Map.from(e.data()), e.id);

          data.add(listjamMasuk);
        }).toList();

        status.value = true;
      }
    } catch (e) {
      Get.defaultDialog(middleText: "Error : $e");
    }
  }

  getJamKeluar() async {
    try {
      final jamKeluar = await rs.collection("jam_keluar").get();

      if (jamKeluar.docs.isNotEmpty) {
        print(jamKeluar.docs);

        jamKeluar.docs.map((e) {
          DetailJamKeluar listjamKeluar =
              DetailJamKeluar.fromJson(Map.from(e.data()), e.id);

          datakeluar.add(listjamKeluar);
        }).toList();

        status.value = true;
      }
    } catch (err) {
      Get.defaultDialog(middleText: "Error: $err");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getdetail();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
