import 'package:covid_info_app/screen/kewaspadaan.dart';
import 'package:covid_info_app/screen/vaksinasi.dart';
import 'package:flutter/material.dart';

import 'package:covid_info_app/screen/rumah_sakit_rujukan.dart';

import 'forumdiskusi.dart';
import 'home_datacovid.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({Key? key}) : super(key: key);
  static const routeName = '/menu';

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(top: 64),
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 500) {
              return _bigCards(context);
            } else {
              return _smallCards(context);
            }
          })),
    );
  }
}

Widget _smallCards(BuildContext context) {
  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: _children(context),
      ),
    ),
  );
}

Widget _bigCards(BuildContext context) {
  List<Widget> children = _children(context);
  return Center(
      child: Column(
    children: [
      Container(
          constraints: BoxConstraints(maxWidth: 900, minWidth: 900),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: children,
          ))
    ],
  ));
}

List<Widget> _children(BuildContext context) {
  List<Widget> children;
  double width = 500;
  if (MediaQuery.of(context).size.width < 500) {
    width = MediaQuery.of(context).size.width * 0.9;
  }
  children = [
    SizedBox(
        width: width,
        child: Card(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Data Covid-19',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Halaman()))
            },
          ),
        )),
    SizedBox(
        width: width,
        child: Card(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Vaksinasi',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Vaksinasi()))
            },
          ),
        )),
    SizedBox(
        width: width,
        child: Card(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Peta Risiko',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IndeksKewaspadaan()))
            },
          ),
        )),
    SizedBox(
        width: width,
        child: Card(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Rumah Sakit Rujukan',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: width,
        child: Card(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Diskusi',
                  style: TextStyle(fontSize: 24, color: Colors.black)),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyCustomForm()))
            },
          ),
        )),
  ];
  return children;
}
