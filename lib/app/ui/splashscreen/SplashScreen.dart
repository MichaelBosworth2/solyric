import 'package:flutter/material.dart';

import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(milliseconds: 3000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black87,
              image: DecorationImage(
                  image: AssetImage(Resources.BACKGROUND),
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Center(
                  child: FractionallySizedBox(
                      widthFactor: .6,
                      child: Image(
                        image: AssetImage(Resources.IC_LOGO),
                        height: 105,
                      ))),
              Spacer(),
              CircularProgressIndicator(),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
