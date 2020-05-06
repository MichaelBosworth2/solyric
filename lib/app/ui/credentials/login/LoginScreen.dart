import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/LoginAuthCard.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/SocialLogin.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(Resources.BACKGROUND),
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
                  Resources.APP_TITLE,
                  style: TextStyle(
                      fontSize: 80,
                      color: Colors.white70,
                      fontFamily: Resources.GREAT_VIBES),
                ),
                UIHelper.verticalSpace(40),
                Text(
                  Resources.INSTRUCTIONS_LOGIN,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                UIHelper.verticalSpaceLarge,
                LoginAuthCard(),
                SocialLogin(),
                UIHelper.verticalSpace(40),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RouteNames.SIGN_UP),
                  child: Text(
                    Resources.NEW_ACCOUNT_LOGIN,
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
