import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'form_datacovid.dart';

/// This is the stateless widget that the main application instantiates.
class Halaman extends StatefulWidget {
  @override
  State<Halaman> createState() => _HalamanState();
}


class _HalamanState extends State<Halaman> {
Future<List<Data>> getData() async {

    var data = await http.get(Uri.parse('http://10.0.2.2:8000/data-covid/get_content'));

    var jsonData = json.decode(data.body);

    List<Data> res = [];

    for(var i in jsonData){

      Data datacov = Data(i["daerah"], i["positif"]);

      res.add(datacov);
      
    }
    
    return List.from(res);
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //drawer: Drawer(
        //child: Text('Yo!'),
      //),
      appBar: AppBar(
        backgroundColor: Colors.brown.shade50,
        title: const Text('PBP-09'),
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Text(
            'Data Covid-19 Nasional',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
              'Data berikut merupakan akumulasi data pasien Covid-19 yang dirawat di Indonesia'),
          cardSatu(),
          cardDua(),
          cardTiga(),
          const SizedBox(height: 28),
          Text(
              'Data Covid-19 Per Daerah'
              ,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            ),
              Text(
              'Data Covid-19 bersifat dummy dan dapat berubah sewaktu-waktu'),
              FutureBuilder(
                future: getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount  : 1,
                      itemBuilder: (BuildContext context, int index) {
                        return cardEmpat(snapshot.data[index].daerah, snapshot.data[index].positif);
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 13),
              ElevatedButton(
                child: Text(
                  "Tambah",
                  style: TextStyle(color: Colors.white),
                ),
                //color: Colors.brown.shade300,
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => BelajarForm()));
                },
              ),
        ],
      ),
    );
  }

  Widget cardSatu() => Card(
        child: Column(
          children: [
            const SizedBox(height: 13),
            Text(
              'Kasus Positif Covid-19 Nasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '4.247.320',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      );

  Widget cardDua() => Card(
        child: Column(
          children: [
            const SizedBox(height: 13),
            Text(
              'Kasus Positif Covid-19 Nasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '4.247.320',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      );

  Widget cardTiga() => Card(
        child: Column(
          children: [
            const SizedBox(height: 13),
            Text(
              'Kasus Positif Covid-19 Nasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '4.247.320',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      );

       Card cardEmpat(String daerah, String positif) {
         return Card(
        child: Column(
          children: [
            Text(
              daerah
            ),
            Text(
              positif
            ),
          ],
        ),
        );
       }
}

class Data{
  final String daerah ;
  final String positif ;

  Data(this.daerah, this.positif);

  Data.fromJson(Map<String, dynamic> json)
    : daerah = json['daerah'],
      positif = json['positif'];
}