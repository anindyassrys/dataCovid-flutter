library dashboard;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covid_info_app/screen/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final title = "Dashboard";
  late CookieRequest request = CookieRequest();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        request = Provider.of<CookieRequest>(context, listen: false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      color: const Color.fromRGBO(237, 234, 229, 1.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      child: ListView(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        children: <Widget>[
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 2.5,
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Padding(
                        child: Column(children: [
                          Container(
                              child: const CircleAvatar(
                                radius: 72.0,
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 12.0)),
                          Container(
                              child: Text(
                                request.username ?? "",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 4.0)),
                          Text("Regular User",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[500]))
                        ]),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0))
                  ]))),
          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 2.5,
                  child: Column(
                      mainAxisSize: MainAxisSize.min, children: <Widget>[]))),
          Container(
            padding: EdgeInsets.fromLTRB(150, 0, 150, 0),
            child: ElevatedButton(
              onPressed: () async {
                request.clear().then((_) {
                  Navigator.popAndPushNamed(context, "/");
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 176, 156, 143)),
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                child: const Text("Log Out"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}


