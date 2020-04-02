import 'package:finances_easy_app/src/models/category_period_value.dart';
import 'package:finances_easy_app/src/models/expense.dart';
import 'package:finances_easy_app/src/models/income.dart';
import 'package:finances_easy_app/src/services/dashboard_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier{

  double _totalSavings;
  List<CategoryPeriodValue> _categoryPeriodValues = [];
  List<Income> _incomes = [];
  List<Expense> _expenses = [];

  double get totalSavings => _totalSavings;
  List<CategoryPeriodValue> get categoryPeriodValues => List.unmodifiable(_categoryPeriodValues);
  List<Income> get incomes => List.unmodifiable(_incomes);
  List<Expense> get expenses => List.unmodifiable(_expenses);
  double get totalIncome => incomes.length > 0 ? incomes.map((elem) => elem.value).reduce((sum, elem) => sum + elem).toDouble() : 0;
  double get totalExpense => expenses.length > 0 ? expenses.map((elem) => elem.value).reduce((sum, elem) => sum + elem).toDouble() : 0;

  Future<void> fetchDashboardData() async {
    _totalSavings = await DashboardService().getTotalSavings();
    _categoryPeriodValues = await DashboardService().getBalance();
    _incomes = await DashboardService().getIncomes();
    _expenses = await DashboardService().getExpenses();
    notifyListeners();
  }

}