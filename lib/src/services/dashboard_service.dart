import 'package:finances_easy_app/src/services/base_service.dart';

class DashboardService extends BaseService {

  Future<double> getBalance() async {
    const url = 'dashboard/totalSavings';
    var result = (await get(url));
    return double.parse(result.toString());
  }
}