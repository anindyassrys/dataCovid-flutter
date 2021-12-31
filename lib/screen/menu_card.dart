import 'package:flutter/material.dart';

import 'package:covid_info_app/screen/rumah_sakit_rujukan.dart';

class MenuCard extends StatefulWidget {
  const MenuCard({Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
          elevation: 18,
          child: Icon(Icons.arrow_left),
          onPressed: () => {Navigator.pop(context)}),
    );
  }
}

Widget _smallCards(BuildContext context) {
  return Center(
    child: Column(
      children: _children(context),
    ),
  );
}

Widget _bigCards(BuildContext context) {
  List<Widget> children = _children(context);
  Widget home = children[0];
  children.remove(home);
  return Center(
      child: Column(
    children: [
      home,
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
  children = [
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
    SizedBox(
        width: 400,
        child: Card(
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    WidgetSpan(
                      child: Icon(Icons.home, size: 36),
                    ),
                    TextSpan(text: 'Home', style: TextStyle(fontSize: 32)),
                  ])),
            ),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const RujukanPage()))
            },
          ),
        )),
  ];
  return children;
}
