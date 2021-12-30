import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RujukanPage extends StatefulWidget {
  const RujukanPage({Key? key}) : super(key: key);

  @override
  State<RujukanPage> createState() => _Rujukan();
}

class _Rujukan extends State<RujukanPage> {
  bool _showBackToTopButton = false;
  String? dropdownValue;
  late List<String> wilayahNames;
  late Map<String, List> wilayahMap;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true;
          } else {
            _showBackToTopButton = false;
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  getRS() async {
    var response = await http.get(Uri.http(
        'covid-information-app.herokuapp.com', 'rumah-sakit-rujukan/jsonRS'));
    var jsonData = jsonDecode(response.body);
    Map<String, List> rsMap = {};
    wilayahNames = jsonData.keys.toList();
    dropdownValue = (dropdownValue == null) ? wilayahNames[0] : dropdownValue;

    for (var i in wilayahNames) {
      List<RumahSakit> rss = [];

      for (var item in jsonData[i]) {
        RumahSakit rs = RumahSakit(
            nama: item['fields']['nama'],
            alamat: item['fields']['alamat'],
            telp: item['fields']['telp'],
            mail: item['fields']['mail']);
        rss.add(rs);
      }

      rsMap[i] = rss;
    }
    wilayahMap = rsMap;
    return rsMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Center(
                    child: Text(
                  'Rumah Sakit Rujukan',
                  style: TextStyle(fontSize: 32),
                ))),
            FutureBuilder(
                future: getRS(),
                builder: (context, snapshot) {
                  List<Widget> children;
                  if (!snapshot.hasData) {
                    children = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      )
                    ];
                  } else {
                    children = [
                      DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: wilayahNames
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                      LayoutBuilder(builder: (context, constraints) {
                        if (constraints.maxWidth > 500) {
                          return _buildList(
                              3, wilayahMap, dropdownValue!, context);
                        } else {
                          return _buildList(
                              1, wilayahMap, dropdownValue!, context);
                        }
                      })
                    ];
                  }
                  return Column(
                    children: children,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}

Widget _buildList(int column, Map map, String wilayah, BuildContext context) {
  List<Widget> children = [];
  List<RumahSakit>? listRS = map[wilayah];
  Widget child;

  for (var rs in listRS!) {
    children.add(templateCard(rs, context));
  }

  if (column == 1) {
    child = Column(
      children: children,
    );
  } else {
    child = SizedBox(
        child: Wrap(
      direction: Axis.horizontal,
      children: children,
    ));
  }

  return Center(
    child: child,
  );
}

Widget templateCard(RumahSakit data, BuildContext context) {
  return Card(
      color: Colors.brown.shade50,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.nama,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            RichText(
                text: TextSpan(children: [
              const WidgetSpan(
                child: Icon(Icons.location_pin, size: 14),
              ),
              TextSpan(text: data.alamat),
            ])),
            RichText(
                text: TextSpan(children: [
              const WidgetSpan(
                child: Icon(Icons.phone, size: 14),
              ),
              TextSpan(text: data.telp),
            ])),
            RichText(
                text: TextSpan(children: [
              const WidgetSpan(
                child: Icon(Icons.mail, size: 14),
              ),
              TextSpan(text: data.mail),
            ])),
          ],
        ),
        width: max(500, MediaQuery.of(context).size.width * 0.45),
        padding: const EdgeInsets.all(8.0),
      ));
}

class Wilayah {
  final String nama;

  Wilayah({
    required this.nama,
  });
}

class RumahSakit {
  final String nama, alamat, telp, mail;

  RumahSakit({
    required this.nama,
    required this.alamat,
    required this.telp,
    required this.mail,
  });
}
