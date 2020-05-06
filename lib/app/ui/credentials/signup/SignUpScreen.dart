import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/SocialLogin.dart';
import 'package:solyric_app/app/ui/credentials/signup/widget/SignUpAuthCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Resources.BACKGROUND),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            AppBar(
              backgroundColor: Colors.transparent,
            ),
            UIHelper.verticalSpace(50),
            Text(
              Resources.SIGN_UP,
              style: TextStyle(
                fontFamily: Resources.GREAT_VIBES,
                fontSize: 80,
                color: Colors.white70,
              ),
            ),
            SignUpAuthCard(),
            SocialLogin(),
            UIHelper.verticalSpaceLarge
          ]),
        ),
      ),
    );
  }
}
