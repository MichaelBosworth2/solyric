import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/SocialLogin.dart';
import 'package:solyric_app/app/ui/credentials/signup/widget/SignUpAuthCard.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: new AppBar(
        backgroundColor: Colors.transparent,

        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),*/
      body: Stack(children: <Widget>[
        Container(
            decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(Resources.BACKGROUND_GRADIENT),
                fit: BoxFit.fill
                ))
            ),
        Container(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 100,
            ),     
            UIHelper.verticalSpace(30),      
            Text(
              Resources.SIGN_UP,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w300),
            ),
            SignUpAuthCard(),
            SocialLogin(),
            UIHelper.verticalSpaceLarge
          ]),
        ),
      )],
     )
    );
  }
}
