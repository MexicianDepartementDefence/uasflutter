// ignore_for_file: unnecessary_overrides, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

class CrudJadwalController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;

  RxBool status = false.obs;

  List<JadwalAbsen> data = [];

  User? user = FirebaseAuth.instance.currentUser;

  inputData() {
    final email = user!.email;
  }

  getJadwal() async {
    try {
      final jadwal = await fs.collection("jadwal").get();
      if (jadwal.docs.isNotEmpty) {
        print(jadwal.docs);

        jadwal.docs.map((e) {
          print(e.data());
          JadwalAbsen listjadwal =
              JadwalAbsen.fromJson(Map.from(e.data()), e.id);

          data.add(listjadwal);
        }).toList();

        status.value = true;
      }
    } catch (e) {
      Get.defaultDialog(middleText: '$e');
    }
  }

  deleteJadwal(String id) async {
    try {
      await fs.collection("jadwal").doc(id).delete();
      Get.defaultDialog(middleText: "Berhasil Menghapus Jadwal");
      Get.offAllNamed(Routes.CRUD_JADWAL);
    } catch (e) {
      Get.defaultDialog(middleText: "Gagal Menghapus Jadwal");
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
