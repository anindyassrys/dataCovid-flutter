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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(202, 195, 190, 1),
        title:const Text('My First Mobile App'),
        centerTitle: true,
        elevation: 0,
      leading: GestureDetector(
      onTap: () { /* Write listener code here */ },
      child: Icon(
              Icons.menu,  // add custom icons also
              ),
      ),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(IconData(63626, fontFamily: 'MaterialIcons')),
          )
        ],
      ),
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
                      title: Text('Pertanyaan Pertama'),
                      children: [
                        Text('isi dari pertanyaan pertama.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Kedua'),
                      children: [
                        Text('isi dari pertanyaan Kedua.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Ketiga'),
                      children: [
                        Text('isi dari pertanyaan Ketiga.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Keempat'),
                      children: [
                        Text('isi dari pertanyaan Keempat.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Kelima'),
                      children: [
                        Text('isi dari pertanyaan Kelima.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Keenam'),
                      children: [
                        Text('isi dari pertanyaan Keenam.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Ketujuh'),
                      children: [
                        Text('isi dari pertanyaan Ketujuh.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Kedelapan'),
                      children: [
                        Text('isi dari pertanyaan Kedelapan.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Kesembilan'),
                      children: [
                        Text('isi dari pertanyaan Kesembilan.', textAlign: TextAlign.justify,),
                      ],
                    ),
                    ExpansionTile(
                      title: Text('Pertanyaan Kesepuluh'),
                      children: [
                        Text('isi dari pertanyaan Kesepuluh.', textAlign: TextAlign.justify,),
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