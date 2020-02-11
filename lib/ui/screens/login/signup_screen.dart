import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/login/SignUpAuthCard.dart';
import 'package:solyric_app/ui/widget/login/SocialLogin.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Resources.background),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            AppBar(
              backgroundColor: Colors.transparent,
            ),
            UIHelper.verticalSpace(50),
            Text(
              Resources.signUp,
              style: TextStyle(
                fontFamily: Resources.greatVibes,
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
