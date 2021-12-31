import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import 'package:covid_info_app/screen/auth.dart';

void _showErrors(context, errors) {
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var errorList in errors.values)
                    for (var error in errorList)
                      Column(children: [
                        Text(error.toString()),
                        const SizedBox(
                          height: 5,
                        )
                      ]),
                ],
              ),
            ),
          ],
        );
      });
}

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String first_name = "";
  String last_name = "";
  String username = "";
  String email = "";
  String password1 = "";
  String password2 = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(237, 234, 229, 1.0),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                          color: Color.fromARGB(255, 19, 19, 19),
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                const SizedBox(
                  height: 30,
                ),
                // Form
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      // First Name
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              first_name = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your first name',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "First name cannot be empty";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // First Name
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              last_name = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your last name',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Last name cannot be empty";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Username
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              username = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Username cannot be empty";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Email
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              email = value;
                            },
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email cannot be empty";
                              } else if (!EmailValidator.validate(value)) {
                                return "Hmm... That email doesn\'t look valid";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Password
                      Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(250, 250, 250, 0.95),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            onChanged: (String value) {
                              password1 = value;
                            },
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(200, 200, 200, 1),
                              ),
                              suffixIcon: IconButton(
                                color: const Color.fromRGBO(200, 200, 200, 1),
                                splashRadius: 1,
                                icon: Icon(isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePasswordView,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password cannot be empty";
                              }
                              return null;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      // Confirm Password
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 250, 0.95),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          onChanged: (String value) {
                            password2 = value;
                          },
                          obscureText: !isPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              color: Color.fromRGBO(200, 200, 200, 1),
                            ),
                            suffixIcon: IconButton(
                              color: const Color.fromRGBO(200, 200, 200, 1),
                              splashRadius: 1,
                              icon: Icon(isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: togglePasswordView,
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password cannot be empty";
                            } else if (value != password1) {
                              return "Password not match";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Register Button
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(177, 157, 143, 1.0)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromRGBO(177, 157, 143, 1.0);
                              }
                              return null;
                            }),
                          ),
                          onPressed: () async {
                            if (_registerFormKey.currentState!.validate()) {
                              final response = await request.post(
                                  "http://10.0.2.2:8000/auth-register",
                                  jsonEncode(<String, String>{
                                    'first_name': first_name,
                                    'last_name': last_name,
                                    'username': username,
                                    'email': email,
                                    'password1': password1,
                                    'password2': password2,
                                  }));

                              if (response["status"] == true) {
                                await request
                                    .login("http://10.0.2.2:8000/auth-login", {
                                  'username': username,
                                  'password': password,
                                });
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/', (Route<dynamic> route) => false);
                              } else {
                                _showErrors(context, response);
                              }
                            }
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: "Already have an account?",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 19, 19, 19),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.popAndPushNamed(context, "/login");
                        }),
                ),
              ],
            ),
          ),
        ));
  }
}
