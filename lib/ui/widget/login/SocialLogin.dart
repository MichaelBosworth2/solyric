import 'package:flutter/material.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';

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
              Resources.loginSocial,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            UIHelper.verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.cake,
                  color: Colors.white70,
                ),
                UIHelper.horizontalSpaceLarge,
                Icon(
                  Icons.email,
                  color: Colors.white70,
                ),
                UIHelper.horizontalSpaceLarge,
                Icon(
                  Icons.print,
                  color: Colors.white70,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
