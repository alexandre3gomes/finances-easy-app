import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          FlutterI18n.translate(context, 'Income'),
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
      child: SafeArea(
        child: Center(child: Text('Income')),
      ),
    );
  }
}
