import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/LoginAuthCard.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/SocialLogin.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

// TODO(wilfredonoyola): I am going to add file GoogleService-Info.plist to ours iOS Project for runs successfully
// Firebase Services as (Authentication, Push Notification).
// See on Trello: https://trello.com/c/v8Ij4cZt


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
              Container(
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  image: const DecorationImage(
                      image: AssetImage(Resources.BACKGROUND),
                      colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                      fit: BoxFit.cover))
              ),
              Container(
              //color: Colors.lightBlue,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UIHelper.verticalSpace(90),
                  Image(
                    image: AssetImage(Resources.IC_LOGO),
                    height: 105,
                  ),
                  UIHelper.verticalSpace(75),
                  Text(
                    Resources.INSTRUCTIONS_LOGIN,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  UIHelper.verticalSpace(15),
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
      ),
    );
  }
}
