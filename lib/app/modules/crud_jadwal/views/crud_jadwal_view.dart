// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable, sized_box_for_whitespace, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uas_flutter_absen/app/controllers/auth_controller.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';
import 'package:uas_flutter_absen/app/modules/tambah-jadwal/controllers/tambah_jadwal_controller.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

import '../controllers/crud_jadwal_controller.dart';

class CrudJadwalView extends GetView<CrudJadwalController> {
  final srt = Get.put(AuthController());
  final bam = Get.put(TambahJadwalController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1C1C),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(() => controller.status.value
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(controller.data.length, (index) {
                    JadwalAbsen dt = controller.data[index];

                    return Container(
                      width: width,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dt.hari,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                dt.tanggalJadwal,
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jam Masuk:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text(
                                            dt.jamMasuk,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Jam Masuk:",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Text(
                                            dt.jamKeluar,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 75,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                     
                                      backgroundColor: Color(0xff1C1C1C),
                                      middleText:
                                          "Data Jadwal Yang Ada Akan Hilang Selamanya",
                                          titleStyle: TextStyle(color: Colors.white),
                                          middleTextStyle: TextStyle(color: Colors.white),
                                      title: "Apa Kamu Yakin?",
                                      confirm: ElevatedButton(
                                        onPressed: () =>
                                            Get.back(),
                                        child: Center(
                                          child: Text(
                                            "Tidak",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff1C1C1C)),
                                      ),
                                      cancel: ElevatedButton(
                                        onPressed: () =>
                                            controller.deleteJadwal(dt.id),
                                        child: Center(
                                          child: Text(
                                            "Ya",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffFFA500)),
                                      )
                                      );
                                },
                                child: Center(
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFA500)),
                                ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: 75,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: ElevatedButton(
                                onPressed: () => Get.toNamed(Routes.UPDATE_JADWAL, arguments: dt),
                                child: Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(backgroundColor: Color(0xffFFA500)),
                                ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )
            : Center(
                child: CircularProgressIndicator(color: Color(0xffFFA500)),
              )),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff1C1C1C),
        child: Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Color(0xffFFA500)),
                  currentAccountPicture: Image.network(
                    "https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png",
                    height: 45,
                  ),
                  accountName: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      "Admin",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  accountEmail: Obx(
                    () => srt.userFirebase.value != null
                        ? Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              srt.userFirebase.value!.email.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.TAMBAH_JADWAL),
                  child: ListTile(
                    leading: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                      weight: 700,
                    ),
                    title: Text(
                      "Add A Schedule",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () => Get.toNamed(Routes.DETAIL_ABSEN),
                  child: ListTile(
                    leading: Icon(
                      Icons.man_2_outlined,
                      color: Colors.white,
                      size: 20,
                      weight: 700,
                    ),
                    title: Text(
                      "Attandance Detail",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        backgroundColor: Color(0xff1C1C1C),
                        title: "Apakah Kamu Yakin?",
                        middleText: "Ingin Keluar Dari Halaman Admin?",
                        titleStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                        middleTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        confirm: ElevatedButton(
                          onPressed: () => Get.offAllNamed(Routes.CRUD_JADWAL),
                          child: Center(
                            child: Text(
                              "Tidak",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff1C1C1C), ),
                        ),
                        cancel: ElevatedButton(
                          onPressed: () => srt.logout(),
                          child: Center(
                            child: Text(
                              "Ya",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFA500)),
                        ));
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 20,
                      weight: 700,
                    ),
                    title: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
