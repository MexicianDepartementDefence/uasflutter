// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/controllers/crud_jadwal_controller.dart';

import '../controllers/qr_scan_controller.dart';

class QrScanView extends GetView<QrScanController> {
  final srt = Get.put(CrudJadwalController());

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QrScanView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              margin: EdgeInsets.only(bottom: 20),
              child: QrImageView(data: srt.data[index].id),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () => controller.scanQr(), child: Text("Scan QR")),
            )
          ],
        ));
  }
}
