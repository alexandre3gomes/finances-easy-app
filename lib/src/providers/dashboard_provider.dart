import 'package:finances_easy_app/src/services/dashboard_service.dart';
import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier{

  double _totalSavings;

  double get totalSavings => _totalSavings;

  Future<void> fetchDashboardData() async {
    _totalSavings = await DashboardService().getBalance();
    notifyListeners();
  }

}