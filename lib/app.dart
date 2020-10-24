import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/state/main.dart';
import 'package:mobile/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  final Widget home;

  const App({
    Key key,
    @required this.home,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(create: (_) => MainState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        onGenerateTitle: (BuildContext context) => "Pensil",
        home: widget.home,
      ),
    );
  }
}
