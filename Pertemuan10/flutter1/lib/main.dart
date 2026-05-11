import 'package:flutter/material.dart';

void main() => runApp(flutter1());

class flutter1 extends StatefulWidget {
  @override
  State<flutter1> createState() => _Flutter1State();
}

class _Flutter1State extends State<flutter1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ini aplikasi saya"),
        ),
        body: Text("Ini data saya"),
      ),
    );
  }
}