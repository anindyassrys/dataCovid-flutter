//@dart = 2.9
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

final webViewKey = GlobalKey<WebViewContainerState>();

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  String _currentIndexes = 'Indeks Kewaspadaan';
  String _currentSources = 'https://datawrapper.dwcdn.net/DfOth/5/';
  List indexes = ['Indeks Kewaspadaan'];
  List sources = ['https://datawrapper.dwcdn.net/DfOth/5/'];

  fetchData() async {
    var url = Uri.parse('https://covid-information-app.herokuapp.com/kewaspadaan/jsonWaspada');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    indexes.clear();
    indexes.add('Indeks Kewaspadaan');
    sources.clear();
    sources.add('https://datawrapper.dwcdn.net/DfOth/5/');

    for (var item in jsonData) {
      indexes.add(item['fields']['name'].toString());
      sources.add(item['fields']['source'].toString());
    }
    return jsonData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Indeks Kewaspadaan")),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        Container(
                            color: Colors.white,
                            alignment: Alignment.center,
                            height:100,
                            child: Text('Indeks Kewaspadaan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Aleo',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    ),
                                ),
                            ),
                        FutureBuilder(
                          future:fetchData(),
                          builder: (context, snapshot) {
                          if (snapshot.hasData) {
                              return Container(
                                  color: Colors.white,
                                  alignment: Alignment(0.0, 0.5),
                                  height:150,
                                  width:350,
                                  child: ListView(
                                  children: <Widget>[
                                      DropdownButtonFormField<String>(
                                          value: _currentIndexes,
                                          items: indexes.map((index) {
                                            return DropdownMenuItem<String>(
                                              value: index,
                                              child: Text(index),
                                            );
                                          }).toList(),
                                          onChanged: (val) => setState(() { _currentIndexes = val; _currentSources = sources.elementAt(indexes.indexOf(val)); webViewKey.currentState.reloadWebView(_currentSources);}), 
                                          ),
                                          Text(
                                            "\nIndeks yang ditampilkan: \n$_currentIndexes",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                  );
                          } else {
                              return Text("-");
                          }
                        }),
                        WebViewContainer(key: webViewKey),
                        ],
                    ),
                ),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  WebViewContainer({Key key}) : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  WebViewController _webViewController;
  String _currentWebView = 'https://datawrapper.dwcdn.net/DfOth/5/';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment(0.0, -0.5),
        height:350,
        width:350,
        child: WebView(
            onWebViewCreated: (WebViewController controller) {
              _webViewController = controller;
            },
            initialUrl: Uri.dataFromString('<html><body><iframe class = "test" title="Indeks Kewaspadaan" aria-label="Map" id="datawrapper-chart-DfOth" src="$_currentWebView" scrolling="no" frameborder="1" style="width: 0; min-width: 100% !important; border: none; padding: none;" height="392" ></iframe></body></html>', mimeType: 'text/html').toString(),
            javascriptMode: JavascriptMode.unrestricted,
        )
      );
  }

  void reloadWebView(String replace) {
    setState(() {_currentWebView = replace; _webViewController.loadUrl(_currentWebView);});
  }
}