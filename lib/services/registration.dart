import 'package:bird/services/log-in.dart';
import 'package:flutter/material.dart';
import 'package:bird/services/auth.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  String error = '';

  register() async {
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.register(email.text, password.text);
      if (result == null)
        setState(() {
          error = 'Email is not valid';
        });
      else
        Navigator.pop(context,
          MaterialPageRoute(builder: (context) {
            return Login();
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
            'register',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* TextFormField(
                    controller: firstName,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: lastName,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ), */
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'enter an email' : null,
                    controller: email,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => value!.length < 8
                        ? 'enter password 8 characters or more'
                        : null,
                    obscureText: true,
                    controller: password,
                    cursorColor: Colors.red,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: register,
                    child: Text(
                      'Registration',
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
                    style: TextStyle(color: Colors.red),
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
