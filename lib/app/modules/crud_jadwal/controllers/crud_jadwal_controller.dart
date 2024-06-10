// ignore_for_file: unnecessary_overrides, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';

class CrudJadwalController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;

  RxBool status = false.obs;

  List<JadwalAbsen> data = [];

  getJadwal() async {
    final jadwal = await fs.collection("jadwal").get();
    if (jadwal.docs.isNotEmpty) {
      print(jadwal.docs);

      jadwal.docs.map((e) {
        print(e.data());
        JadwalAbsen listjadwal = JadwalAbsen.fromJson(Map.from(e.data()), e.id);
        print(e);
      }).toList();

      status.value = true;
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    getJadwal();
    super.onInit();
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
