import 'package:flutter/material.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';
import 'package:solyric_app/ui/screens/login/forgot_password_screen.dart';
import 'package:solyric_app/ui/screens/login/login_screen.dart';
import 'package:solyric_app/ui/screens/login/signup_screen.dart';
import 'package:solyric_app/ui/screens/post/new_lyric.dart';
import 'package:solyric_app/ui/screens/profile/MyProfile.dart';
import 'package:solyric_app/ui/screens/tutorial/tutorial_home.dart';
import 'package:solyric_app/ui/screens/wall/MyWall.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.newLyric:
        return MaterialPageRoute(builder: (_) => NewLyric());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.myWall:
        return MaterialPageRoute(builder: (_) => MyWall());
      case Routes.myProfile:
        return MaterialPageRoute(builder: (_) => MyProfile());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.tutorial:
        return MaterialPageRoute(builder: (_) => TutorialHome());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
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
