import 'package:finances_easy_app/src/providers/auth_provider.dart';
import 'package:finances_easy_app/src/screens/auth_screen.dart';
import 'package:finances_easy_app/src/screens/home_screen.dart';
import 'package:finances_easy_app/src/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:provider/provider.dart';

void main({String env = 'dev'}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset('$env.json');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: CupertinoApp(
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
                useCountryCode: false,
                basePath: 'assets/i18n',
                fallbackFile: 'assets/i18n/en.json'),
          ),
        ],
        title: 'Finances Easy',
        theme: CupertinoThemeData(
          brightness: Brightness.light
        ),
        home: Consumer<AuthProvider>(builder: (context, auth, _) {
          return auth.isAuthenticate
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogon(),
                  builder: (context, authResultSnapshot) {
                    if (authResultSnapshot.data != null &&
                        authResultSnapshot.data) {
                      return HomeScreen();
                    }
                    return authResultSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? SplashScreen()
                        : AuthScreen();
                  });
        }),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          AuthScreen.routeName: (context) => AuthScreen(),
        },
      ),
    );
  }
}
