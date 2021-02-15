import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/ui/post/util/LyricArguments.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';

import 'Resources.dart';

/// UI Related reusable stuff
class UIHelper {
  /// @param [BuildContext] host build context
  /// @param [allowBackStack] whether you want to have a default back button
  static AppBar commonAppBar(BuildContext context,
          {bool backButton = true,
          String logo = Resources.IC_LOGO,
          bool backgroundTransparent = false}) =>
      AppBar(
          backgroundColor: backgroundTransparent ? Colors.transparent : null,
          elevation: 0.0,
          automaticallyImplyLeading: backButton,
          centerTitle: true,
          title: actionBarLogo(logo),
          actions: actionBarActions(context));

  /// Builds common action bar logo image
  static Widget actionBarLogo(String logo) => Container(
        padding: EdgeInsets.only(bottom: 6, top: 6),
        height: 50,
        child: Image.asset(logo),
      );

  /// Builds common action bar default actions
  /// @see [NewLyricScreen] [TBD LYRIC SCREEN] [TBD CHAT SCREEN]
  static List<Widget> actionBarActions(BuildContext context) => [
        IconButton(
          icon: SvgPicture.asset(Resources.IC_EDIT),
          onPressed: () => Navigator.pushNamed(context, RouteNames.NEW_LYRIC,
              arguments: LyricArguments(editMode: false)),
        ),
        IconButton(
            icon: SvgPicture.asset(Resources.IC_MIC),
            onPressed: () =>
                Navigator.pushNamed(context, RouteNames.NEW_RECORD)),
        IconButton(
          icon: SvgPicture.asset(Resources.IC_BELL),
          onPressed: () {},
        )
      ];

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

  static void showMessage(BuildContext context, String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
}
