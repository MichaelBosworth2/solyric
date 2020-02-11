import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';

import 'Resources.dart';

/// UI Related reusable stuff
class UIHelper {

  static AppBar solyricAppBar(BuildContext context) => AppBar(
          title: Container(
            padding: EdgeInsets.only(bottom: 6, top: 6),
            height: 50,
            child: Image.asset(Resources.logo),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(Resources.icEdit),
              onPressed: () => Navigator.pushNamed(context, Routes.newLyric),
            ),
            IconButton(
              icon: SvgPicture.asset(Resources.icMic),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(Resources.icBell),
              onPressed: () {},
            )
          ]);

  static const TextStyle cardTitle =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);

  static Widget emptyText = Text("");

  static const TextStyle styleTitle =
      TextStyle(fontSize: 20, color: Colors.white);

  static const TextStyle styleCover =
      TextStyle(fontSize: 30, color: Colors.white);

  static const Widget verticalSpaceLarge = SizedBox(
    height: 30,
  );

  static const Widget horizontalSpaceLarge = SizedBox(
    width: 30,
  );

  static const Widget verticalSpaceSmall = SizedBox(
    height: 10,
  );

  static const Widget horizontalSpaceSmall = SizedBox(
    width: 10,
  );

  static Widget verticalSpace(double size) => SizedBox(
        height: size,
      );

  static Widget horizontalSpace(double size) => SizedBox(
        width: size,
      );

  static void errorMessage(BuildContext context) =>
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong please try again later')));

  static void custom(BuildContext context, String error) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(error)));
}
