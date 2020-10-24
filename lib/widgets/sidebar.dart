import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final String title;

  Sidebar(this.title);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(automaticallyImplyLeading: false, title: Text(title)),
        ],
      ),
    );
  }
}
