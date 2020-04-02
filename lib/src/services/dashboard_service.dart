import 'dart:convert';

import 'package:finances_easy_app/src/models/category.dart';
import 'package:finances_easy_app/src/models/category_period_value.dart';
import 'package:finances_easy_app/src/models/expense.dart';
import 'package:finances_easy_app/src/models/income.dart';
import 'package:finances_easy_app/src/models/period_value.dart';
import 'package:finances_easy_app/src/services/base_service.dart';
import 'package:flutter/cupertino.dart';

class DashboardService extends BaseService {

  static final String _url = 'dashboard/';

  Future<double> getTotalSavings() async {
    final result = await get(_url + 'totalSavings');
    return double.parse(result.toString());
  }

  Future<List<CategoryPeriodValue>> getBalance() async {
    final result = await get(_url + 'actualBalance');
    Iterable list = result;
    return list.map((val) => CategoryPeriodValue.fromJson(val)).toList();
  }

  Future<List<Income>> getIncomes() async {
    final result = await get(_url + 'actualIncome');
    Iterable list = result;
    return list.map((val) => Income.fromJson(val)).toList();
  }

  Future<List<Expense>> getExpenses() async {
    final result = await get(_url + 'actualExpense');
    Iterable list = result;
    return list.map((val) => Expense.fromJson(val)).toList();
  }
}