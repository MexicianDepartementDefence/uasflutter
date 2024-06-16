// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uas_flutter_absen/app/modules/crud_jadwal/model/modelcrud.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/controllers/detail_absen_controller.dart';
import 'package:uas_flutter_absen/app/modules/detail_absen/model/modeldetail.dart';
import 'package:uas_flutter_absen/app/routes/app_pages.dart';

import '../controllers/update_jadwal_controller.dart';

class UpdateJadwalView extends GetView<UpdateJadwalController> {
  const UpdateJadwalView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    JadwalAbsen data = Get.arguments;
    controller.updateVariable(data);
    final srt = Get.put(DetailAbsenController());
    DetailJamMasuk dataAbsen = srt.data[index];
    return Scaffold(
      backgroundColor: Color(0xff1C1C1C),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1C1C),
        title: const Text('UpdateJadwalView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SfDateRangePicker(
              initialSelectedDate: controller.tanggalJadwal.value,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.single,
              onSelectionChanged: controller.onSelectionChanged,
              selectionColor: Color(0xffFFA500),
              minDate: DateTime(2024),
              maxDate: DateTime(2027),
              headerStyle: DateRangePickerHeaderStyle(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
              monthViewSettings: DateRangePickerMonthViewSettings(
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Color(0xffFFA500)),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                textStyle: TextStyle(color: Colors.white),
                todayTextStyle: TextStyle(color: Color(0xffFFA500)),
                disabledDatesTextStyle: TextStyle(color: Colors.grey),
              ),
              rangeSelectionColor: Color(0xffFFA500),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller.jamMasuk,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Masukkan Jam Masuk',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller.jamKeluar,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Masukkan Jam Keluar',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            TextField(
              controller: controller.hari,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Masukkan Hari',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color(0xffFFA500)))),
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 175,
              height: 75,
              child: ElevatedButton(
                onPressed: () => controller.updateJadwal(data.id, srt.),
                child: Center(
                  child: Text(
                    "Masukkan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFFA500)),
              ),
            ),
            Container(
              width: 175,
              height: 75,
              child: ElevatedButton(
                onPressed: () => Get.offAllNamed(Routes.CRUD_JADWAL),
                child: Center(
                  child: Text(
                    "Keluar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
