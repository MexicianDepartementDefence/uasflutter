// ignore_for_file: unnecessary_overrides, unnecessary_brace_in_string_interps, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';


class QrScanController extends GetxController {
  FirebaseFirestore fs = FirebaseFirestore.instance;
  List<JadwalAbsen> data = [];
  RxBool status = false.obs;

  scanQr() async {
    String qr = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Batal", true, ScanMode.QR);

    Get.defaultDialog(middleText: "hasil Scan Adalah ${qr}");
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
      Get.defaultDialog(middleText: "Error : $e");
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
