import 'dart:convert';

DetailJamKeluar detailJamKeluarFromJson(String str, String id) => DetailJamKeluar.fromJson(json.decode(str), id);

String detailJamKeluarToJson(DetailJamKeluar data) => json.encode(data.toJson());

class DetailJamKeluar {
    String id;
    String email;
    bool status;
    String jamAbsen;

    DetailJamKeluar({
        required this.id,
        required this.email,
        required this.status,
        required this.jamAbsen,
    });

    factory DetailJamKeluar.fromJson(Map<String, dynamic> json, String id) => DetailJamKeluar(
        id: id,
        email: json["email"],
        status: json["status"],
        jamAbsen: json["jam_absen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "status": status,
        "jam_absen": jamAbsen,
    };
}
