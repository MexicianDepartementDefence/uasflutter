// ignore_for_file: unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeldetail.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

class UpdateJadwalController extends GetxController {
  var tanggalJadwal = DateTime.now().obs;

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      tanggalJadwal.value = args.value;
    }
  }

  List<DetailJamMasuk> data = [];

  TextEditingController jamMasuk = TextEditingController();
  TextEditingController jamKeluar = TextEditingController();
  TextEditingController hari = TextEditingController();

  FirebaseFirestore rm = FirebaseFirestore.instance;

  updateVariable(JadwalAbsen data) {
    jamMasuk.text = data.jamMasuk;
    jamKeluar.text = data.jamKeluar;
    hari.text = data.hari;
  }

  updateJadwal(String id, String id_absen) async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.defaultDialog(middleText: "User not authenticated");
      return;
    }
    CollectionReference jadwal = rm.collection("jadwal");
    CollectionReference detailAbsenMasuk = rm.collection("jam_masuk");

    final dataJadwal = {
      "hari": hari.text,
      "tanggal_jadwal": DateFormat('dd-MM-yyyy').format(tanggalJadwal.value),
      "jam_masuk": jamMasuk.text,
      "jam_keluar": jamKeluar.text,
      "status": false,
      "user_id": user.uid,
    };

    final dataAbsen = {"jam_absen": "", "status": false};
    try {
      var jadwalDoc = await jadwal.doc(id).get();
      var detailAbsenDoc = await detailAbsenMasuk.doc(id_absen).get();

      if (jadwalDoc.exists && detailAbsenDoc.exists) {
        await jadwal.doc(id).update(dataJadwal);
        await detailAbsenMasuk.doc(id_absen).update(dataAbsen);
        Get.offAllNamed(Routes.CRUD_JADWAL);
      } else {
        Get.defaultDialog(middleText: "One or both documents not found");
      }
    } catch (e) {
      Get.defaultDialog(middleText: "Error : $e");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
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
