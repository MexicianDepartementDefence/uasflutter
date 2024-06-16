// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/controllers/crud_jadwal_controller.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';

import '../controllers/qr_scan_controller.dart';

class QrScanView extends GetView<QrScanController> {
  final srt = Get.put(CrudJadwalController());

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0Xff1C1C1C),
        title: const Text('QrScanView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
          () => controller.status.value ?
          Expanded(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  JadwalAbsen data = controller.data[index];
                  return ListTile(
                    title: Text(
                      'Item ${data.tanggalJadwal}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Some other info',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.qr_code, color: Colors.white,),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: 300,
                                height: 300,
                                child:
                                    QrImageView(data: data.id),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ) : Center(
              child: CircularProgressIndicator(color: Color(0xffFFA500),),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () => controller.scanQr(), child: Text("Scan QR")),
          ),
        ],
      ),
    );
  }
}
