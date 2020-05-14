import 'package:flutter/material.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SocialLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: GestureDetector(
        onTap: () => Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("TBD"),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Resources.SOCIAL_LOGIN,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            UIHelper.verticalSpaceLarge,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SvgPicture.asset(
                      Resources.IC_FACEBOOK,
                      color: Colors.white,
                    ),
                   SvgPicture.asset(
                      Resources.IC_TWITTER,
                      color: Colors.white,
                    ),
                  SvgPicture.asset(
                      Resources.IC_GOOGLE_PLUS,
                      color: Colors.white
                    )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
