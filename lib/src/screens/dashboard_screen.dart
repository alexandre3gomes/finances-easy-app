import 'package:charts_flutter/flutter.dart' as charts;
import 'package:finances_easy_app/src/models/category_period_value.dart';
import 'package:finances_easy_app/src/models/income.dart';
import 'package:finances_easy_app/src/providers/auth_provider.dart';
import 'package:finances_easy_app/src/providers/dashboard_provider.dart';
import 'package:finances_easy_app/src/widgets/bar_chart.dart';
import 'package:finances_easy_app/src/widgets/dashboard_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static final String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _isLoading = false;

  _fetchData(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<DashboardProvider>(context, listen: false)
          .fetchDashboardData();
      setState(() {
        _isLoading = false;
      });
    } catch (exception) {
      print(exception);
    }
    ;
  }

  @override
  initState() {
    super.initState();
    _fetchData(context);
  }

  List<charts.Series<CategoryPeriodValue, String>> _buildExpensesChart(
      List<CategoryPeriodValue> catValues) {
    return [
      new charts.Series<CategoryPeriodValue, String>(
        id: FlutterI18n.translate(context, 'Actual'),
        domainFn: (CategoryPeriodValue cat, _) => cat.category.name,
        measureFn: (CategoryPeriodValue cat, _) =>
        cat.periodValue[0].actualValue,
        labelAccessorFn: (CategoryPeriodValue cat, _) =>
        '€' + cat.periodValue[0].actualValue.toString(),
        data: catValues,
      ),
      new charts.Series<CategoryPeriodValue, String>(
        id: FlutterI18n.translate(context, 'Planned'),
        domainFn: (CategoryPeriodValue cat, _) => cat.category.name,
        measureFn: (CategoryPeriodValue cat, _) =>
        cat.periodValue[0].plannedValue,
        labelAccessorFn: (CategoryPeriodValue cat, _) =>
        '€' + cat.periodValue[0].plannedValue.toString(),
        data: catValues,
      )
    ];
  }

  _showLogoffDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(FlutterI18n.translate(context, 'Confirm logout')),
          content: Text(
            FlutterI18n.translate(context, 'Do you really want logout?'),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
                child: Text(FlutterI18n.translate(context, 'Ok')),
                onPressed: () {
                  Provider.of<AuthProvider>(context).logout();
                  Navigator.of(context).pushNamed('auth');
                }),
            CupertinoDialogAction(
              child: Text(FlutterI18n.translate(context, 'Cancel')),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

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
//                  IconButton(
//                    icon: Icon(Icons.power_settings_new),
//                    onPressed: () => _showLogoffDialog(context),
//                  )
                ],
              );
            },
          ),
          middle: Text(
            FlutterI18n.translate(context, 'Dashboard'),
            style: CupertinoTheme
                .of(context)
                .textTheme
                .navLargeTitleTextStyle,
          )),
      child: _isLoading
          ? CupertinoActivityIndicator()
          : Consumer<DashboardProvider>(
        builder: (context, dashboard, _) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    DashboardCard(Colors.blue, FlutterI18n.translate(context, 'Income'), dashboard.totalIncome.toString()),
                    DashboardCard(Colors.red, FlutterI18n.translate(context, 'Expense'), dashboard.totalExpense.toString()),
                    DashboardCard(Colors.green, FlutterI18n.translate(context, 'Savings'), dashboard.totalSavings.toString()),
                    Container(
                      width: double.infinity,
                      height: 700,
                      child: BarChart(
                        _buildExpensesChart(dashboard.categoryPeriodValues),
                        animate: true,
                      ),
                    ),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
