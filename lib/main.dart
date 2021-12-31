<<<<<<< HEAD
=======
import 'package:flutter/material.dart';
<<<<<<< HEAD
// import 'package:provider.dart';

import 'package:covid_info_app/screen/menu_card.dart';
import 'package:covid_info_app/screen/rumah_sakit_rujukan.dart';
=======
>>>>>>> 5bd509b0ffa654e6465587390ee65119a757097d
import 'package:provider/provider.dart';
import 'package:covid_info_app/screen/auth.dart';
import 'package:covid_info_app/screen/login_page.dart';
import 'package:covid_info_app/screen/register_page.dart';
<<<<<<< HEAD
import 'screen/home_datacovid.dart';
=======
>>>>>>> 5bde4883fad6bdc9c883533cddca811d399b6dae
>>>>>>> 5bd509b0ffa654e6465587390ee65119a757097d

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MenuCard();
=======
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();

          return request;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          routes: {"/login": (BuildContext context) => const LoginScreen()},
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    request.init(context);
    child:
    return Scaffold(
      backgroundColor: Color.fromRGBO(144, 228, 252, 10),
      body: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Container(
            child: Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 120.0),
              alignment: Alignment.topCenter,
              child: new Text(
                "Welcome to\nCovid App",
                textAlign: TextAlign.center,
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 80.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (Buildercontext) => LoginScreen()),
                  );
                },
                color: Color(0xFF807166),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Text(
                  "Login",
                  style: TextStyle(color: Color(0xFF807166), fontSize: 40.0),
                ),
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                color: Color(0xFF807166),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Text(
                  "Register",
                  style: TextStyle(color: Color(0xFF807166), fontSize: 40.0),
                ),
              ),
            )
          ],
        )),
      ),
    );
>>>>>>> 5bde4883fad6bdc9c883533cddca811d399b6dae
  }
}
