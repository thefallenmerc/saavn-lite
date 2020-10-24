import 'package:flutter/material.dart';
import 'package:mobile/widgets/sidebar.dart';

class Skeleton extends StatelessWidget {
  final Widget child;

  Skeleton({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Sidebar("Saavn Pru"),
        appBar: AppBar(
          title: Text("Saavn Pru"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: this.child,
        ),
      ),
    );
  }
}
