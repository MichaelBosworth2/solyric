import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/forgot/widget/ForgotAuthCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

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
                image: AssetImage(Resources.BACKGROUND),
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
                Resources.TITLE_FORGOT,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white70,
                    fontFamily: Resources.GREAT_VIBES),
              ),
              UIHelper.verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Text(
                  Resources.INSTRUCTIONS_FORGOT,
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
