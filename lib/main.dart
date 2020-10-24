import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/app.dart';
import 'package:mobile/config/config.dart';
import 'package:mobile/config/config_provider.dart';
import 'package:mobile/screens/splash.dart';

void main() {
  final config = devConfig();
  runApp(AppConfig(
    config: config,
    child: App(home: Splash()),
  ));
}