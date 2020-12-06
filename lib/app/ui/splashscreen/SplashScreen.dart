import 'package:flutter/material.dart';

import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';
import 'package:solyric_app/app/utils/Resources.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image image1;
  Image image2;
  @override
  void initState() {
    image1 = Image.asset(Resources.BACKGROUND);
    image2 = Image.asset(Resources.IC_LOGO);
    Future.delayed(
        Duration(milliseconds: 5000),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
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
                  image: image1.image,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: FractionallySizedBox(
                      widthFactor: .6,
                      child: Image(
                        image: image2.image,
                        height: 105,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
