// ignore_for_file: unnecessary_overrides, sort_child_properties_last, prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_print, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

class TambahJadwalController extends GetxController {
  var tanggaljadwal = DateTime.now().obs;

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      tanggaljadwal.value = args.value;
    }

    
  }

  TextEditingController jamMasuk = TextEditingController();

  TextEditingController jamKeluar = TextEditingController();

  TextEditingController hari = TextEditingController();

  FirebaseFirestore rs = FirebaseFirestore.instance;

   tambahJadwal() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Get.defaultDialog(middleText: "User not authenticated");
      return;
    }

    final dataJadwal = {
      "tanggal_jadwal": tanggaljadwal.value,
      "jamMasuk": jamMasuk.text,
      "jamKeluar": jamKeluar.text,
      "hari": hari.text,
      "status" : false,
      "user_id": user.uid,
    };

    try {
      await rs.collection("jadwal").add(dataJadwal).then((value) {
        Get.defaultDialog(
          middleText: "Berhasil Menambahkan Jadwal",
          confirm: ElevatedButton(
            onPressed: () => Get.offAllNamed(Routes.CRUD_JADWAL), // Use your actual route here
            child: Center(
              child: Text(
                "Kembali",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFA500)),
          ),
        );
      });
    } catch (e) {
      Get.defaultDialog(middleText: "Gagal Menambahkan Sebuah Jadwal: $e");
    }
  }

  @override
  void onClose() {
    jamMasuk.dispose();
    jamKeluar.dispose();
    hari.dispose();
    super.onClose();
  }
}
