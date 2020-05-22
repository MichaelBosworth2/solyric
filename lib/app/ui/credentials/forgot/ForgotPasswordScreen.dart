import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/forgot/widget/ForgotAuthCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:google_fonts/google_fonts.dart';

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
                image: AssetImage(Resources.BACKGROUND_GRADIENT),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 100,
              ), 
              UIHelper.verticalSpace(130),
              Text(
                Resources.TITLE_FORGOT,
                style: GoogleFonts.lato(
                  color: Colors.white, 
                  fontSize: 40, 
                  fontWeight: FontWeight.w300
                ),
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
