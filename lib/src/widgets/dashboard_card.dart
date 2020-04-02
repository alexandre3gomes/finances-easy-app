import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class DashboardCard extends StatelessWidget {

  Color _color;
  String _text;
  String _value;

  DashboardCard(this._color, this._text, this._value);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: CupertinoColors.systemGrey4,
              blurRadius: 5,
            ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CircleAvatar(backgroundColor: _color,),
            Text(
              _text,
              style: CupertinoTheme
                  .of(context)
                  .textTheme
                  .navTitleTextStyle,
            ),
            Text(_value + ' EUR',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
