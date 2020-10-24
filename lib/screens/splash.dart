import 'package:flutter/material.dart';
import 'package:mobile/helpers/images.dart';
import 'package:mobile/screens/homepage.dart';
import 'package:mobile/theme/theme.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  void redirect() async {
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, HomePage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: AppTheme.fullHeight(context) - 50,
        width: AppTheme.fullWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Images.icon, width: 128),
            SizedBox(height: 30),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
