import 'package:finances_easy_app/src/providers/auth_provider.dart';
import 'package:finances_easy_app/src/providers/dashboard_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  static final String routeName = '/dashboard';

  _fetchData(BuildContext context) async {
    await Provider.of<DashboardProvider>(context, listen: false).fetchDashboardData();
  }


  @override
  Widget build(BuildContext context) {
    _fetchData(context);
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
          leading: Consumer<AuthProvider>(
            builder: (context, auth, _) {
              return Row(
                children: <Widget>[
                  Icon(Icons.account_circle),
                  Text(auth.loggedUser.name),
                ],
              );
            },
          ),
          middle: Text(
            FlutterI18n.translate(context, 'Dashboard'),
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          )),
      child: SafeArea(
        child: Center(
            child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: CupertinoColors.activeGreen,
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Consumer<DashboardProvider>(
            builder: (context, dash, _){
              return Center(
                  child: Text(
                      dash.totalSavings.toString(),
                      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                  ),
              );
            },
          ),
        )),
      ),
    );
  }
}
