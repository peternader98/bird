import 'package:flutter/material.dart';

import 'package:bird/services/auth.dart';

class Contacts extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            TextButton.icon(
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.logout),
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}
