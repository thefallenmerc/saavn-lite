
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  static get route => MaterialPageRoute(builder: (_) => HomePage());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppBar(
        title: Text("Settings"),
      ),
      appBar: AppBar(
        title: Text("Saavn Pru"),
      ),
      body: Container(
        child: Text("RED 23"),
      ),
    );
  }
}