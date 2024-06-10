// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

JadwalAbsen jadwalAbsenFromJson(String str, String id) =>
    JadwalAbsen.fromJson(json.decode(str), id);

String jadwalAbsenToJson(JadwalAbsen data) => json.encode(data.toJson());

class JadwalAbsen {
  String id;
  String tanggalJadwal;
  String jamMasuk;
  String jamKeluar;
  String hari;
  bool status;
  String user_id;

  JadwalAbsen({
    required this.id,
    required this.tanggalJadwal,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.hari,
    required this.status,
    required this.user_id
  });

  factory JadwalAbsen.fromJson(Map<String, dynamic> json, String id) =>
      JadwalAbsen(
        id: id,
        tanggalJadwal: json["tanggal_jadwal"],
        jamMasuk: json["jam_masuk"],
        jamKeluar: json["jam_keluar"],
        hari: json["hari"],
        status: json["status"],
        user_id: json["user_id"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_jadwal": tanggalJadwal,
        "jam_masuk": jamMasuk,
        "jam_keluar": jamKeluar,
        "hari": hari,
        "status": status,
        "user_id": user_id
      };
}
