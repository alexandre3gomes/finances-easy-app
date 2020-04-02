import 'package:finances_easy_app/src/providers/auth_provider.dart';
import 'package:finances_easy_app/src/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {

  static final String routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  var _isLoading = false;

  Future<SharedPreferences>_getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  _showLoginError(BuildContext ctx, String message) {
    showCupertinoDialog(
      context: ctx,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(FlutterI18n.translate(context, 'Error')),
          content: Text(
            FlutterI18n.translate(context, message),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(FlutterI18n.translate(context, 'Ok')),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  _handleLogin(BuildContext ctx) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<AuthProvider>(ctx, listen: false).login(_username.text, _password.text);
      Navigator.pushNamed(ctx, HomeScreen.routeName);
    } catch (exception) {
      _showLoginError(ctx, exception.toString());
    } finally {
      setState(() {
      _isLoading = false;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          FlutterI18n.translate(context, 'Finances Easy'),
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(50),
                child: Image.asset('assets/images/logo.png'),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 30),
                      child: CupertinoTextField(
                        controller: _username,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        textInputAction: TextInputAction.done,
                        placeholder: FlutterI18n.translate(context, 'Username'),
                        scrollPadding: EdgeInsets.only(bottom: 200),
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
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, bottom: 30),
                      child: CupertinoTextField(
                        controller: _password,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        placeholder: FlutterI18n.translate(context, 'Password'),
                        scrollPadding: EdgeInsets.only(bottom: 200),
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
                      child: _isLoading ? CupertinoActivityIndicator() : CupertinoButton(
                        borderRadius: BorderRadius.circular(8),
                        color: CupertinoColors.activeBlue,
                        child: Text(FlutterI18n.translate(context, 'Login')),
                        onPressed: () {
                          if (_username.text.isEmpty ||
                              _password.text.isEmpty) {
                            _showLoginError(context, 'Invalid username/password');
                          } else {
                            _handleLogin(context);
                          }
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
