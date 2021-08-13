import 'package:flutter/material.dart';
import 'package:neecoder/controllers/auth/auth_controller.dart';
import 'package:neecoder/main.dart';
import 'package:neecoder/pages/home.dart';
import 'package:neecoder/pages/login.dart';
import 'package:http/http.dart' as http;

import '../colors.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTop(),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      child: TextFormField(
                        controller: username,
                        validator: (t) {
                          if (t!.isEmpty) {
                            return "Please enter your username.";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Username",
                          labelText: "Username",
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Card(
                      child: TextFormField(
                        controller: password,
                        validator: (t) {
                          if (t!.isEmpty) {
                            return "Please enter your password.";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Password",
                          labelText: "Password",
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsetsDirectional.all(18),
                                  primary: kcPrimaryColor),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  authController.register(
                                      username.text, password.text);
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (_) => HomeView(),
                                  ));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Successfully registered!"),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("Invalid username or password."),
                                    ),
                                  );
                                }
                              },
                              child: Text("CREATE ACCOUNT"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: kcPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildTop() {
    return Column(
      children: [
        Text(
          "Create Account",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "create a new account",
          style: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
