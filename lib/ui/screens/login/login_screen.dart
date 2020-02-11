import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/login/LoginAuthCard.dart';
import 'package:solyric_app/ui/widget/login/SocialLogin.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Resources.background),
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UIHelper.verticalSpace(90),
                Text(
                  Resources.solyric,
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.white70,
                      fontFamily: Resources.greatVibes),
                ),
                UIHelper.verticalSpace(40),
                Text(
                  Resources.loginInstructions,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                UIHelper.verticalSpaceLarge,
                LoginAuthCard(),
                SocialLogin(),
                UIHelper.verticalSpace(40),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.signUp),
                  child: Text(
                    Resources.loginNewAccount,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                UIHelper.verticalSpaceLarge
              ],
            )),
          )
        ],
      ),
    );
  }
}
