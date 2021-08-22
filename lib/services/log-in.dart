import 'package:bird/contacts.dart';
import 'package:bird/services/auth.dart';
import 'package:bird/services/registration.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String error = '';

  login() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.signIn(email.text, password.text);
      if (result == null)
        setState(() {
          error = 'Email or password is incorrect';
        });
      else
        Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return Contacts();
          })
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red.shade700,
          title: Text(
            'log in',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return Registration();
                    }));
              },
              child: Text('sign up'),
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'enter an email' : null,
                    controller: email,
                    cursorColor: Colors.red.shade700,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => value!.length < 8
                        ? 'enter password 8 characters or more'
                        : null,
                    controller: password,
                    obscureText: true,
                    cursorColor: Colors.red.shade700,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: login,
                    child: Text(
                      'log in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red.shade700,
                      elevation: 5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
