import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discussion form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Abduh Page'),
      home: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("PBP 09")),
        key: _formKey,
        body: SingleChildScrollView(
          child: Center(
              child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Forum Diskusi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(1.0),
                            fontSize: 36,
                          ),
                        ),
                        Text('Hai,',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black.withOpacity(1.0))),
                        Text(
                          'Selamat datang di forum diskusi, silahkan melihat topik diskusi yang sudah ada atau tambahkan topik diskusi baru',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(1.0)),
                        ),
                      ],
                    ),
                  ),
                ),
                FractionallySizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()));
                        },
                        child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text('Tambahkan Topik Diskusi'))),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.5)),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Judul Diskusi',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.black)),
                          const Text('Oct.30, 2021, 3.42 a.m. oleh anonymous',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Isi diskusi',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9))),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.5)),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Judul Diskusi',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.black)),
                          const Text('Oct.30, 2021, 3.42 a.m. oleh anonymous',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Isi diskusi',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9))),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.5)),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Judul Diskusi',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.black)),
                          const Text('Oct.30, 2021, 3.42 a.m. oleh anonymous',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Isi diskusi',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9))),
                          )
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue.withOpacity(0.5)),
                  child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Judul Diskusi',
                              style:
                                  TextStyle(fontSize: 32, color: Colors.black)),
                          const Text('Oct.30, 2021, 3.42 a.m. oleh anonymous',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Isi diskusi',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.9))),
                          )
                        ],
                      )),
                )
              ],
            ),
          )),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  String? judul;
  String? pesan;
  final _formKey = GlobalKey<FormState>();

  SecondRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PBP 09")),
      key: _formKey,
      body: Center(
          child: FractionallySizedBox(
        widthFactor: 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextFormField(
            //   // The validator receives the text that the user has entered.
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter some text';
            //     }
            //     return null;
            //   },
            // ),
            const Text(
              'Topik diskusi Baru',
            ),
            Text(
              'Covid-19',
              style: Theme.of(context).textTheme.headline3,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  onSaved: (String? value) {
                    judul = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Judul",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 2.0),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: TextFormField(
                  onSaved: (String? value) {
                    pesan = value;
                  },
                  decoration: const InputDecoration(
                    labelText: "Pesan",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 2.0),
                    ),
                  ),
                  maxLines: 8,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                  Navigator.pop(context);
                },
                child: const Text('Tambah'),
              ),
            ),
          ],
        ),
      )),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
