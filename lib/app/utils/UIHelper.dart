import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';

import 'Resources.dart';

/// UI Related reusable stuff
class UIHelper {
  static AppBar commonAppBar(BuildContext context) => AppBar(
          title: Container(
            padding: EdgeInsets.only(bottom: 6, top: 6),
            height: 50,
            child: Image.asset(Resources.IC_LOGO),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(Resources.IC_EDIT),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteNames.NEW_LYRIC),
            ),
            IconButton(
              icon: SvgPicture.asset(Resources.IC_MIC),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(Resources.IC_BELL),
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

  static const Widget verticalSpaceLarge = SizedBox(height: 30);

  static const Widget horizontalSpaceLarge = SizedBox(width: 30);

  static const Widget verticalSpaceSmall = SizedBox(height: 10);

  static const Widget horizontalSpaceSmall = SizedBox(width: 10);

  static Widget verticalSpace(double size) => SizedBox(height: size);

  static Widget horizontalSpace(double size) => SizedBox(width: size);

  static void errorMessage(BuildContext context) =>
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Something went wrong please try again later')));
}
