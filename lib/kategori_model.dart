import 'dart:convert';
import 'package:http/http.dart' as http;

class Kategori {
  String namaKategori;
  int vaksinDosisPertama;
  int vaksinDosisKedua;
  int targetVaksinDosis;
  String perTanggal;

  Kategori(
      {required this.namaKategori,
      required this.vaksinDosisPertama,
      required this.vaksinDosisKedua,
      required this.targetVaksinDosis,
      required this.perTanggal});

  factory Kategori.createKategori(Map<String, dynamic> json) {
    return Kategori(
        namaKategori: json['fields']['nama_kategori'],
        vaksinDosisPertama: json['fields']['telah_vaksin_dosis_1'],
        vaksinDosisKedua: json['fields']['telah_vaksin_dosis_2'],
        targetVaksinDosis: json['fields']['target_vaksin'],
        perTanggal: json['fields']['per_tanggal']);
  }

  static Future<Kategori> connectToAPI(int index) async {
    // unused
    var apiURL = Uri.parse(
        'http://covid-information-app.herokuapp.com/vaksinasi/kategori');

    var apiResult = await http.get(apiURL) as String;
    var json = jsonDecode(apiResult);
    return Kategori.createKategori(json[index]);
  }
}
