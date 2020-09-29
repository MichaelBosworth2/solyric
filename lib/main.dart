import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/credentials/login/LoginScreen.dart';

import 'app/di/ProviderModule.dart';
import 'app/utils/Resources.dart';
import 'app/utils/SolyricRouter.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(SolyricApp());
}

class SolyricApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderModule.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Resources.APP_TITLE,
        theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0),
          primaryColor: Color(0xFF353535),
          accentColor: Colors.purpleAccent,
        ),
        home: LoginScreen(),
        onGenerateRoute: (settings) =>
            SolyricRouter.routes(settings),
      ),
    );
  }
}
