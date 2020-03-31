import 'package:finances_easy_app/src/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            FlutterI18n.translate(context, 'Expenses'),
            style:
            CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          )
      ),
      child: SafeArea(
        child: Center(child: Text('Expense')),
      ),
    );
  }
}
