import 'package:finances_easy_app/src/screens/auth_screen.dart';
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
          translationLoader: FileTranslationLoader(
              useCountryCode: false,
              basePath: 'assets/i18n',
              fallbackFile: 'assets/i18n/en.json'
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
