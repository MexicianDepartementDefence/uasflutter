// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/controllers/auth_controller.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeldetail.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeljamkeluar.dart';
import '../controllers/detail_absen_controller.dart';

class DetailAbsenView extends GetView<DetailAbsenController> {
  final srt = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1C1C),
        title: const Text('DetailAbsenView'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: srt.authStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Jam Masuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              "Nomor",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                        rows: List.generate(controller.data.length, (index) {
                          var nomor = index + 1;
                          DetailJamMasuk dt = controller.data[index];
                          return DataRow(cells: [
                            DataCell(Text(nomor.toString())),
                            DataCell(Text(dt.email)),
                            DataCell(dt.status
                                ? Text(
                                    "Sudah Absen",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Text(
                                    "Belum Absen",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                          ]);
                        }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Jam Keluar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              "Nomor",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Status",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                        rows: List.generate(controller.datakeluar.length, (index) {
                          var nomor = index + 1;
                          DetailJamKeluar dt = controller.datakeluar[index];
                          return DataRow(cells: [
                            DataCell(Text(nomor.toString())),
                            DataCell(Text(dt.email)),
                            DataCell(dt.status
                                ? Text(
                                    "Sudah Absen",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                : Text(
                                    "Belum Absen",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                          ]);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFA500),
              ),
            );
          }
        },
      ),
    );
  }
}

