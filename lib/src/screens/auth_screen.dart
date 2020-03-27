import 'package:finances_easy_app/src/screens/dashboard_screen.dart';
import 'package:finances_easy_app/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class AuthScreen extends StatelessWidget {

   var _username = TextEditingController();
   var _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Finances Easy',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MediaQuery.of(context).viewInsets.bottom > 0 ? Container(padding: EdgeInsets.all(30),) :
              Container(
                  padding: EdgeInsets.all(50),
                  child: Image.asset('assets/images/logo.png'),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                      child: CupertinoTextField(
                        controller: _username,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        textInputAction: TextInputAction.done,
                        placeholder: FlutterI18n.translate(context, 'Username'),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.black,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                      child: CupertinoTextField(
                        controller: _password,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        textInputAction: TextInputAction.done,
                        placeholder: FlutterI18n.translate(context, 'Password'),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: CupertinoColors.black,
                              width: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(8),
                        color: CupertinoColors.activeBlue,
                        child: Text(FlutterI18n.translate(context, 'Login')),
                        onPressed: () {
                          print(_username.text);
                          print(_password.text);
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
