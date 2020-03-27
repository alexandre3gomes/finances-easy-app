import 'package:finances_easy_app/src/screens/auth_screen.dart';
import 'package:finances_easy_app/src/screens/dashboard_screen.dart';
import 'package:finances_easy_app/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: NetworkFileTranslationLoader(
            useCountryCode: false,
            baseUri:
                Uri.https('finances-easy-web.herokuapp.com', 'assets/i18n'),
          ),
        ),
      ],
      title: 'Finances Easy',
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          navLargeTitleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: CupertinoColors.black),
        ),
      ),
      routes: {
        '/': (_) => AuthScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
