import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/ui/screens/post/new_lyric.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/Routes.dart';
import 'package:solyric_app/ui/shared/provider_setup.dart';

void main() => runApp(SolyricApp());

class SolyricApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderSetUp.providers,
      child: MaterialApp(
        title: Resources.solyric,
        theme: ThemeData(
          primaryColor: Color(0xFF353535),
          accentColor: Colors.purpleAccent,
        ),
        home: NewLyric(),
        onGenerateRoute: Router.generateRoutes,
      ),
    );
  }
}
