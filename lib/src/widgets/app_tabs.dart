import 'package:finances_easy_app/src/providers/dashboard_provider.dart';
import 'package:finances_easy_app/src/screens/dashboard_screen.dart';
import 'package:finances_easy_app/src/screens/expense_screen.dart';
import 'package:finances_easy_app/src/screens/income_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

class AppTabsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            title: Text(FlutterI18n.translate(context, 'Dashboard')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            title: Text(FlutterI18n.translate(context, 'Incomes')),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            title: Text(FlutterI18n.translate(context, 'Expenses')),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 1:
            return CupertinoTabView(builder: (context) {
              return IncomeScreen();
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return ExpenseScreen();
            });
          default:
            return CupertinoTabView(builder: (context) {
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider<DashboardProvider>(create: (context) => DashboardProvider())
                ],
                child: DashboardScreen(),
              );
            });
        }
      },
    );
  }
}
