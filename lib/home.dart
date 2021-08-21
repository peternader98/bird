import 'package:flutter/material.dart';

import 'services/registration.dart';
import 'services/log-in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to bird!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
              ),
            ),
            Padding(padding: const EdgeInsets.all(40.0)),
            MaterialButton(
              onPressed: login,
              color: Colors.red,
              elevation: 5,
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('Login',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            MaterialButton(
              onPressed: register,
              color: Colors.red,
              elevation: 5,
              padding: EdgeInsets.symmetric(horizontal: 26),
              child: Text('Registration',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Registration();
    }));
  }

  void login(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();
    }));
  }
}
