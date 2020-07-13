import 'package:flutter/material.dart';
import 'package:solyric_app/app/ui/credentials/forgot/ForgotPasswordScreen.dart';
import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';
import 'package:solyric_app/app/ui/credentials/signup/SignUpScreen.dart';
import 'package:solyric_app/app/ui/post/NewLyricScreen.dart';
import 'package:solyric_app/app/ui/post/util/LyricArguments.dart';
import 'package:solyric_app/app/ui/profile/ProfileScreen.dart';
import 'package:solyric_app/app/ui/tutorial/TutorialScreen.dart';
import 'package:solyric_app/app/ui/wall/WallScreen.dart';
import 'package:solyric_app/app/ui/record/RecordScreen.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';

class SolyricRouter {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.NEW_LYRIC:
        {
          final LyricArguments args = settings.arguments;
          return MaterialPageRoute(
              builder: (_) => NewLyricScreen(editMode: args.editMode));
        }
      case RouteNames.LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteNames.WALL:
        return MaterialPageRoute(builder: (_) => WallScreen());
      case RouteNames.PROFILE:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RouteNames.SIGN_UP:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RouteNames.TUTORIAL:
        return MaterialPageRoute(builder: (_) => TutorialScreen());
      case RouteNames.FORGOT_PASSWORD:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
       case RouteNames.NEW_RECORD:
        return MaterialPageRoute(builder: (_) => RecordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static T getArgument<T>(BuildContext context) =>
      ModalRoute.of(context).settings.arguments as T;
}
