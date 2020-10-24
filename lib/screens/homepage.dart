import 'package:flutter/material.dart';
import 'package:mobile/widgets/skeleton.dart';

class HomePage extends StatefulWidget {
  static get route => MaterialPageRoute(builder: (_) => HomePage());

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Skeleton(
      child: Text("RED"),
    );
  }
}
