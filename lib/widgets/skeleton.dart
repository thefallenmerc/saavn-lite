import 'package:flutter/material.dart';
import 'package:mobile/widgets/media_player.dart';
import 'package:mobile/widgets/sidebar.dart';

class Skeleton extends StatelessWidget {
  final Widget child;

  Skeleton({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* drawer: Sidebar("Saavn Pru"),
      appBar: AppBar(
        title: Text("Saavn Pru"),
      ), */
      body: SafeArea(
        child: Column(
          children: [
            // Rest of the body
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: this.child,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            // Media Player
            MediaPlayer()
          ],
        ),
      ),
    );
  }
}
