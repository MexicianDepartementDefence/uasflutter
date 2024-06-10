// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_local_variable, sized_box_for_whitespace, sort_child_properties_last, unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uas_flutter_absen/app/controllers/auth_controller.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

import '../controllers/crud_jadwal_controller.dart';

class CrudJadwalView extends GetView<CrudJadwalController> {
  final srt = Get.put(AuthController());

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
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(controller.data.length, (index) {
                  JadwalAbsen dt = controller.data[index];

               
                  return Container(
                    width: width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dt.tanggalJadwal)
                      ],
                    ),
                  );
                }),
              )
            : Center(
                child: CircularProgressIndicator(color: Color(0xffFFA500)),
              )),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff1C1C1C),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png",
                  height: 45,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Admin",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                )
              ],
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
                onPressed: () {},
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
                            backgroundColor: Color(0xffFFA500)),
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
    );
  }
}
