import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Form Covid-19",
    home: BelajarForm(
    ),
  ));
}


class BelajarForm extends StatefulWidget {
  @override
  _BelajarFormState createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

String input = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      drawer: Drawer(
        child: Text('Dummy'),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: Text("PBP-09"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
            'Form Data Covid',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontFamily: 'Sora',
            ),
          ),
          const SizedBox(height: 13),
          Text(
            'Silakan isi form di bawah ini untuk menambahkan data daerah kasus Covid-19',
            style: TextStyle(
              fontFamily: 'Sora',
            ),
          ),
          const SizedBox(height: 13),
              // TextField(),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: DKI Jakarta",
                  labelText: "Daerah",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!= null && value.isEmpty) {
                    return 'Daerah tidak boleh kosong!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 13),
              TextFormField(
                decoration: new InputDecoration(
                  hintText: "contoh: 26.098",
                  labelText: "Kasus positif",
                  border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0)),
                ),
                validator: (value) {
                  if (value!= null && value.isEmpty) {
                    return 'Kasus positif tidak boleh kosong!';
                  }
                  input = value!;
                  return null;
                },
              ),
              const SizedBox(height: 13),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.brown.shade300,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(input + " kasus positif berhasil ditambahkan")),
                  );
                }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}