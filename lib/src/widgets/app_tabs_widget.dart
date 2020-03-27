
import 'package:finances_easy_app/src/screens/dashboard_screen.dart';
import 'package:finances_easy_app/src/screens/expense_screen.dart';
import 'package:finances_easy_app/src/screens/income_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTabsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Income'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text('Income'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return DashboardScreen();
            });
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
              return DashboardScreen();
            });
        }
      },
    );
  }
}
