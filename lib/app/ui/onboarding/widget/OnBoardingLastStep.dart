import 'package:flutter/material.dart';

import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';

class OnBoardingLastStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
                image: AssetImage(Resources.BACKGROUND_H),
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              Resources.IMAGE_A,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Image.asset(
              Resources.IMAGE_H,
              width: MediaQuery.of(context).size.width / 1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.3, // match_parent
              child: RaisedButton(
                color: Colors.transparent,
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, RouteNames.HOME),
                child:
                    const Text('Get Started', style: TextStyle(fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: BorderSide(color: Colors.white, width: 2)),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
