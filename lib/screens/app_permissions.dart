import 'package:flutter/material.dart';

class AppPermission extends StatelessWidget {
  const AppPermission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Permissions'),
        centerTitle: true,
        backgroundColor: Color(0xFF339C84),
      ),
    );
  }
}

