import 'package:finances_easy_app/src/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class DashboardScreen extends StatelessWidget {
  static final String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          FlutterI18n.translate(context, 'Dashboard'),
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
      child: SafeArea(
        child: Center(child: Text('Dashboard')),
      ),
    );
  }
}
