 

import 'dart:convert';

DetailJamMasuk detailJamMasukFromJson(String str, String id) => DetailJamMasuk.fromJson(json.decode(str), id);

String detailJamMasukToJson(DetailJamMasuk data) => json.encode(data.toJson());

class DetailJamMasuk {
    String id;
    String email;
    bool status;
    String jamAbsen;

    DetailJamMasuk({
        required this.id,
        required this.email,
        required this.status,
        required this.jamAbsen,
    });

    factory DetailJamMasuk.fromJson(Map<String, dynamic> json, String id) => DetailJamMasuk(
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