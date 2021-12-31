import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'kategori_model.dart';

void main() {
  runApp(const Vaksinasi());
}

class Vaksinasi extends StatelessWidget {
  const Vaksinasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Vaksinasi",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromRGBO(202, 195, 190, 1),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromRGBO(237, 234, 229, 1),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Apa itu vaksin?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          'Vaksin adalah sediaan biologis yang digunakan untuk menghasilkan kekebalan adaptif terhadap penyakit infeksi tertentu. Biasanya, vaksin mengandung agen atau zat yang menyerupai mikroorganisme penyebab penyakit dan sering kali dibuat dari mikroorganisme yang dilemahkan atau dimatikan, dari toksinnya, atau dari salah satu protein permukaannya. Agen dalam vaksin merangsang sistem imun agar dapat mengenali agen tersebut sebagai ancaman, menghancurkannya, dan mengingatnya agar sistem imun dapat kembali mengenali dan menghancurkan mikroorganisme yang berhubungan dengan agen tersebut saat ditemui pada masa depan.',
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Mengapa perlu divaksin?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          'Mengingat akan penyakit Covid-19 yang sedang mewabah saat ini dan telah memakan banyak korban jiwa, vaksinasi mengambil peran penting dalam pembentukan herd immunity di masyarakat. Herd immunity merupakan suatu kondisi ketika sebagian besar populasi kebal terhadap penyakit menular tertentu sehingga memberikan perlindungan tidak langsung kepada kelompok masyarakat yang tidak kebal terhadap penyakit menular tersebut. Hal ini dapat mengurangi tingkat penularan yang kemudian juga mengurangi angka kematian yang terjadi.',
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            'Progress vaksinasi per kategori',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        KategoriDropdown(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KategoriDropdown extends StatefulWidget {
  const KategoriDropdown({Key? key}) : super(key: key);

  @override
  _KategoriDropdownState createState() => _KategoriDropdownState();
}

class _KategoriDropdownState extends State<KategoriDropdown> {
  String dropdownValue = 'Semua Vaksinasi';
  int index = 0;

  final List<Kategori> _list = <Kategori>[];

  Future<List<Kategori>> fetchJson() async {
    var apiURL = Uri.parse(
        'http://covid-information-app.herokuapp.com/vaksinasi/kategori');

    var apiResult = await http.get(apiURL);
    var json = jsonDecode(apiResult.body);

    for (var item in json) {
      _list.add(Kategori.createKategori(item));
    }

    return _list;
  }

  String persentaseDosisPertamaString() {
    var numerator = _list[index].vaksinDosisPertama;
    var denominator = _list[index].targetVaksinDosis;
    var result = numerator * 100 / denominator;
    return result.toStringAsFixed(1) + " %";
  }

  String persentaseDosisKeduaString() {
    var numerator = _list[index].vaksinDosisKedua;
    var denominator = _list[index].targetVaksinDosis;
    var result = numerator * 100 / denominator;
    return result.toStringAsFixed(1) + " %";
  }

  double persentaseDosisPertama() {
    var numerator = _list[index].vaksinDosisPertama;
    var denominator = _list[index].targetVaksinDosis;
    var result = numerator / denominator;
    return result;
  }

  double persentaseDosisKedua() {
    var numerator = _list[index].vaksinDosisKedua;
    var denominator = _list[index].targetVaksinDosis;
    var result = numerator / denominator;
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(
                        'Pilih kategori : ',
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        value: dropdownValue,
                        icon: const Icon(Icons.expand_more),
                        iconSize: 24,
                        elevation: 1,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? newValue) {
                          dropdownValue = newValue!;
                          if (dropdownValue == 'Semua Vaksinasi') {
                            index = 0;
                          } else if (dropdownValue == 'Tenaga Kesehatan') {
                            index = 1;
                          } else if (dropdownValue == 'Petugas Publik') {
                            index = 2;
                          } else if (dropdownValue == 'Lanjut Usia') {
                            index = 3;
                          } else if (dropdownValue ==
                              'Masyarakat Rentan dan Umum') {
                            index = 4;
                          } else if (dropdownValue ==
                              'Kelompok Usia 12-17 Tahun') {
                            index = 5;
                          }

                          setState(() {});
                        },
                        items: <String>[
                          'Semua Vaksinasi',
                          'Tenaga Kesehatan',
                          'Petugas Publik',
                          'Lanjut Usia',
                          'Masyarakat Rentan dan Umum',
                          'Kelompok Usia 12-17 Tahun',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: SizedBox(
                            width: 450,
                            height: 20,
                            child: Text(
                              'Vaksinasi Dosis 1',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(46, 52, 59, 1),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(46, 52, 59, 1),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          width: 450,
                          height: 230,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                child: Text(
                                  dropdownValue,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  _list[index].vaksinDosisPertama.toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(51, 137, 254, 1),
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'dosis pertama telah diberikan',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.5),
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: 400,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  148, 148, 148, 0.171),
                                              border: Border.all(
                                                width: 1,
                                                color: const Color.fromRGBO(
                                                    46, 52, 59, 1),
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8))),
                                          width: 330,
                                          height: 20,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        2, 136, 9, 1),
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          const Color.fromRGBO(
                                                              2, 136, 9, 1),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                width:
                                                    persentaseDosisPertama() *
                                                        325,
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: SizedBox(
                                          width: 50,
                                          height: 20,
                                          child: Text(
                                            persentaseDosisPertamaString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  child: Text(
                                      persentaseDosisPertamaString() +
                                          ' dari ' +
                                          _list[index]
                                              .targetVaksinDosis
                                              .toString() +
                                          ' telah divaksin',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 30, 10, 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'Pembaruan terakhir : ' +
                                        _list[index].perTanggal,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: SizedBox(
                            width: 450,
                            height: 20,
                            child: Text(
                              'Vaksinasi Dosis 2',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(46, 52, 59, 1),
                              border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(46, 52, 59, 1),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          width: 450,
                          height: 230,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                                child: Text(
                                  dropdownValue,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Text(
                                  _list[index].vaksinDosisKedua.toString(),
                                  style: const TextStyle(
                                      color: Color.fromRGBO(51, 137, 254, 1),
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'dosis kedua telah diberikan',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1.5),
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: 400,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  148, 148, 148, 0.171),
                                              border: Border.all(
                                                width: 1,
                                                color: const Color.fromRGBO(
                                                    46, 52, 59, 1),
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8))),
                                          width: 330,
                                          height: 20,
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        2, 136, 9, 1),
                                                    border: Border.all(
                                                      width: 1,
                                                      color:
                                                          const Color.fromRGBO(
                                                              2, 136, 9, 1),
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                width: persentaseDosisKedua() *
                                                    325,
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 0, 0),
                                        child: SizedBox(
                                          width: 50,
                                          height: 20,
                                          child: Text(
                                            persentaseDosisKeduaString()
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  child: Text(
                                      persentaseDosisKeduaString() +
                                          ' dari ' +
                                          _list[index]
                                              .targetVaksinDosis
                                              .toString() +
                                          ' telah divaksin',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 30, 10, 10),
                                child: SizedBox(
                                  width: 400,
                                  child: Text(
                                    'Pembaruan terakhir : ' +
                                        _list[index].perTanggal.toString(),
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
                child: Container(
                    child: const CircularProgressIndicator(),
                    color: const Color.fromRGBO(237, 234, 229, 1)));
          }
        });
  }
}
