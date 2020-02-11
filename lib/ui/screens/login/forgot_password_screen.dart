import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/widget/login/ForgotAuthCard.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        height: deviceSize.size.height,
        width: deviceSize.size.width,
        decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Resources.background),
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
              ),
              UIHelper.verticalSpace(90),
              Text(
                Resources.forgotTitle,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white70,
                    fontFamily: Resources.greatVibes),
              ),
              UIHelper.verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  Resources.forgotInstructions,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              ForgotAuthCard()
            ],
          ),
        ),
      ),
    );
  }
}
