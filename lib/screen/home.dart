import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get color => Color.fromRGBO(237, 234, 229, 1);
  // final urlImage = [
  //
  // ];
  Future <Map<String, dynamic>> getUserData() async {
    final response = await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries/indonesia'));
    return jsonDecode(response.body);
  }

  final String _url = 'https://www.google.com/search?q=apa+itu+COVID-19&sxsrf=AOaemvLUCsam7PyShBu846Qc5ORxj2wdew%3A1635904457608&ei=yeuBYajTJMzl9QO6o6LQBw&oq=apa+itu+COVID-19&gs_lcp=Cgdnd3Mtd2l6EAMyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEMsBOgcIIxDqAhAnOgQIIxAnOggIABCABBCxAzoLCAAQgAQQsQMQgwE6CgguEMcBENEDEEM6CAguELEDEIMBOg0ILhCxAxDHARCjAhBDOgQIABBDOgcIABCxAxBDOgcIABDJAxBDOgUIABCSAzoHCAAQgAQQCkoECEEYAFDzK1joR2DpSWgBcAB4AIAB_gGIAfoLkgEGMTEuNC4xmAEAoAEBsAEKwAEB&sclient=gws-wiz&ved=0ahUKEwjo29OAi_vzAhXMcn0KHbqRCHoQ4dUDCA0&uact=5';
  final String _url1 = 'https://www.google.com/search?q=cara+penanganan+covid-19&sxsrf=AOaemvIu02-q5s3eRDADm6WX33f1rXsPmw%3A1635904468703&ei=1OuBYYiWKtPerQHZybuYBw&oq=cara&gs_lcp=Cgdnd3Mtd2l6EAEYADIECCMQJzIECCMQJzIECCMQJzIECAAQQzIECAAQQzIECAAQQzIECAAQQzIICAAQgAQQsQMyCAgAEIAEELEDMgUIABCABDoHCCMQ6gIQJzoHCAAQsQMQQzoKCAAQsQMQgwEQQzoFCAAQsQNKBAhBGABQ7_tSWOL_UmCAjFNoAXAAeACAAYUBiAGBA5IBAzIuMpgBAKABAbABCsABAQ&sclient=gws-wiz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 234, 229, 1),
      body:
      SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 265.0,
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                  top: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(202, 195, 190, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color.fromRGBO(105, 105, 105, 1).withOpacity(0.30),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Spacer(),
                        Image(
                          image: AssetImage('assets/images/favicon.png'),
                        ),
                      ],
                    ),
                    Text('Selamat Datang!,', style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold,), textAlign: TextAlign.left,),

                    const Text('Situs ini memuat info seputar penyakit COVID-19 di Indonesia, '
                        'mulai dari data penyakit COVID-19 terkini, info vaksinasi, rujukan rumah sakit, '
                        'hingga forum untuk berdiskusi seputar penyakit COVID-19.', textAlign: TextAlign.justify,),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Apa itu COVID-19?', style: TextStyle(fontWeight: FontWeight.bold),),
                                const Text('COVID-19 adalah penyakit yang disebabkan oleh virus corona atau severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2). COVID-19 dapat menyebabkan gangguan sistem pernapasan, mulai dari gejala yang ringan seperti flu, hingga infeksi paru-paru, seperti pneumonia.', textAlign: TextAlign.justify,)
                              ],
                            )
                        ),

                        const Expanded(
                          child: Image(
                            image: AssetImage('assets/images/virus-corona.png'),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _launchURL,
                      child: Text('Pelajari Lebih lanjut'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(202, 195, 190, 1),
                        shadowColor: Color.fromRGBO(237, 234, 229, 1),
                        elevation: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Cara Penanganan COVID-19', style: TextStyle(fontWeight: FontWeight.bold)),
                    CarouselSlider(
                      options:
                      CarouselOptions(
                        // height: 145.0,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        'assets/images/Gambar_1.png',
                        'assets/images/Gambar_2.png',
                        'assets/images/Gambar_3.png',
                        'assets/images/Gambar_4.png',
                        'assets/images/Gambar_5.png'
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(237, 234, 229, 1)
                                ),
                                child: Image(
                                image: AssetImage(i),)
                            );
                          },
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: _launchURL1,
                      child: Text('Pelajari Lebih lanjut'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(202, 195, 190, 1),
                        shadowColor: Color.fromRGBO(237, 234, 229, 1),
                        elevation: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Kasus Positif COVID-19 Hari Ini', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Text('Data COVID-19 di Indonesia.', textAlign: TextAlign.justify,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 150.0,
                          height: 65.0,
                          child: Card(
                            color: Color.fromRGBO(46, 76, 109, 1),
                            child: FutureBuilder(
                            future: getUserData(),
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                return Column(
                                  children: [
                                    Text('Total Kasus positif: ', style: TextStyle(color: Colors.white),),
                                    Text((snapshot.data as Map)['cases'].toString(), style: TextStyle(color: Colors.white),),
                                  ],
                                );
                              }else return CircularProgressIndicator();
                            },
                          ),
                          ),
                        ),
                        SizedBox(
                          width: 150.0,
                          height: 65.0,
                          child: Card(
                            color: Color.fromRGBO(255, 81, 81, 1),
                            child: FutureBuilder(
                            future: getUserData(),
                            builder: (context, snapshot){
                              if(snapshot.hasData){
                                return Column(
                                  children: [
                                    Text('Kasus positif Hari Ini: ', style: TextStyle(color: Colors.white),),
                                    Text((snapshot.data as Map)['todayCases'].toString(), style: TextStyle(color: Colors.white),),
                                  ],
                                );
                              }else return CircularProgressIndicator();
                            },
                          ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('FAQ', style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                    ExpansionTile(
                      title: Text('Apa itu Virus Korona?'),
                      children: [
                        Text('Virus korona adalah sebutan untuk jenis virus yang dapat menyebabkan penyakit pada hewan dan manusia. Disebut korona karena bentuknya yang seperti mahkota (korona ~ crown = mahkota dalam bahasa Latin).Beberapa contoh penyakit pada manusia yang disebabkan oleh virus korona antara lain MERS (Sindrom Pernafasan Timur Tengah) dan SARS (Sindrom Pernafasan Akut Parah).Virus korona terbaru yang ditemukan yang ditemukan di Wuhan, Tiongkok, pada bulan Desember 2019 diberi nama SARS Coronavirus 2 (SARS-CoV-2) dan menyebabkan penyakit Coronavirus Disease 2019 (COVID-19).', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Apa bedanya dengan COVID-19?'),
                      children: [
                        Text('COVID-19 adalah penyakit menular yang disebabkan oleh virus korona SARS-CoV-2. Dengan kata lain, SARS-CoV-2 adalah nama virusnya, sementara COVID-19 adalah nama penyakitnya. Ini seperti HIV yang adalah nama virus dari penyakit AIDS.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Bagaimana COVID-19 menular?'),
                      children: [
                        Text('Penularan terjadi melalui droplet (butir-butir tetesan cairan) dari hidung atau mulut yang menyebar saat pembawa virus COVID-19 batuk, bersin atau meler. Tetesan cairan tersebut akan menempel pada benda atau permukaan di sekitarnya. Dan kemudian masuk ke mulut, hidung atau mata. Atau menyentuh permukaan bekas terkena butir cairannya dengan tangan lalu tangan mengusap mulut, hidung atau mata. Inilah alasan pentingnya sering-sering cuci tangan dan jangan menyentuh muka dengan tangan.Orang sehat dapat tertular saat tangan mereka menyentuh permukaan yang terkena tetesan tersebut dan kemudian tanpa sadar menyentuh mata, mulut, ataupun hidung (selaput lendir). Virus juga bisa masuk saat orang sehat secara tidak sengaja menghirup tetesan cairan saat si pembawa virus batuk atau bersin.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Jika seseorang terinfeksi virus ini, berapa lama sampai muncul gejala?'),
                      children: [
                        Text('Masa inkubasi (dari masuknya virus ke dalam tubuh sampai munculnya gejala awal) adalah 1 – 14 hari, dengan rata-rata timbulnya gejala selama 5 hari.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Seberapa banyak pasien yang akan mengalami gejala serius?'),
                      children: [
                        Text('Dari data yang tersedia saat ini, kita belum bisa menyimpulkan secara persis seberapa parah wabah COVID-19 ini. Tingkat keparahan dan mortalitas suatu wabah juga akan sangat tergantung pada kapasitas sistem kesehatan publik setempat dalam menangani kasus yang ada. Namun, temuan awal mengindikasikan bahwa tingkat keparahan COVID-19 lebih rendah dibandingkan SARS. Berdasarkan data dari 44 ribu pasien yang dirilis oleh Centre of Disease Control di Tiongkok, proporsi pasien dengan gejala ringan/serius/kritis dan tingkat kematiannya adalah sebagai berikut:', textAlign: TextAlign.justify,),
                        Text('- Gejala ringan seperti flu biasa: 81% (tingkat kematian: 0).'),
                        Text('- Gejala lebih serius seperti sesak napas dan pneumonia (radang paru-paru): 14% (tingkat kematian: 0).'),
                        Text('- Perlu masuk ICU dengan kondisi kritis karena gagal pernapasan, syok septik, dan gagal multi-organ: 5% (tingkat kematian: 50%).'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Bagaimanakah tingkat kematian akibat penyakit ini jika dilihat dari kelompok usia?'),
                      children: [
                        Text('Berdasarkan data yang sama, tingkat kematian akibat penyakit ini sesuai golongan umur adalah sebagai berikut:', textAlign: TextAlign.justify,),
                        Text('- 0-9 tahun : 0%'),
                        Text('- 10-19 : 0,2%'),
                        Text('- 20-29 : 0,2%'),
                        Text('- 30-39 : 0,2%'),
                        Text('- 40-49 : 0,4%'),
                        Text('- 50-59 : 1,3%'),
                        Text('- 60-69 : 3,6%'),
                        Text('- 70-79 : 8.0%'),
                        Text('- >80 : 14,8%'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Bagaimanakah tingkat kematian akibat penyakit ini jika dilihat dari jenis kelamin?'),
                      children: [
                        Text('Berdasarkan data yang sama, tingkat kematian penderita laki-laki lebih tinggi dari penderita perempuan, yaitu laki-laki sebanyak 2,8%, sementara perempuan 1,7%.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Bagaimanakah tingkat kematian akibat penyakit ini jika dilihat dari ada/tidak adanya penyakit penyerta/komorbiditas lainnya?'),
                      children: [
                        Text('- Kondisi tanpa penyakit penyerta apapun: 0,9%'),
                        Text('- Pasien dengan penyakit kardiovaskular: 10,5%'),
                        Text('- Diabetes: 7,3%'),
                        Text('- Saluran pernapasan kronis: 6,3%'),
                        Text('- Tekanan darah tinggi: 6%'),
                        Text('- Kanker: 5,6%'),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Apa yang harus saya sampaikan kepada tenaga medis jika saya batuk pilek demam dan sulit bernafas?'),
                      children: [
                        Text('1. Riwayat perjalanan (jika ada, ke Tiongkok atau negara-negara yang sudah terjangkit COVID-19, seperti Singapura, Jepang, Korea Selatan, dan Italia).'),
                        Text('2. Kapan gejala mulai timbul.'),
                        Text('3. Adakah kontak selama 14 hari terakhir dengan seseorang yang memiliki gejala pernapasan dan baru datang dari salah satu daerah yang ditemukan memiliki kasus COVID-19.'),
                        Text('Dokter Anda yang akan menentukan langkah selanjutnya.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Bagaimana saya dapat dinyatakan positif atau negatif Covid-19?'),
                      children: [
                        Text('1. Sampel spesimen akan diambil menggunakan alat berbentuk batang cotton bud namun lebih panjang, melalui hidung.'),
                        Text('2. Sampel tersebut akan dikirim ke laboratorium untuk dites PCR (Reaksi Berantai Polimerase). Pemerintah sudah menunjuk laboratorium di 10 kota yaitu Batam, Medan, Palembang, Makassar, Manado, Ambon, Jakarta, Bandung, Yogyakarta, Surabaya, dan Banjarmasin untuk melakukan tes ini.'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void _launchURL1() async {
    if (!await launch(_url1)) throw 'Could not launch $_url1';
  }
}



class User {
  final String cases, todayCases;
  User(this.cases, this.todayCases);

}