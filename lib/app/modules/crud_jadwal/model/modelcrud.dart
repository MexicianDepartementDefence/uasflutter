import 'dart:convert';

JadwalAbsen jadwalAbsenFromJson(String str, String id) => JadwalAbsen.fromJson(json.decode(str), id);

String jadwalAbsenToJson(JadwalAbsen data) => json.encode(data.toJson());

class JadwalAbsen {
    String id;
    String tanggalJadwal;
    String jamMasuk;
    String jamKeluar;
    String hari;
    bool status;

    JadwalAbsen({
        required this.id,
        required this.tanggalJadwal,
        required this.jamMasuk,
        required this.jamKeluar,
        required this.hari,
        required this.status,
    });

    factory JadwalAbsen.fromJson(Map<String, dynamic> json, String id) => JadwalAbsen(
        id: id,
        tanggalJadwal: json["tanggal_jadwal"],
        jamMasuk: json["jam_masuk"],
        jamKeluar: json["jam_keluar"],
        hari: json["hari"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal_jadwal": tanggalJadwal,
        "jam_masuk": jamMasuk,
        "jam_keluar": jamKeluar,
        "hari": hari,
        "status": status,
    };
}