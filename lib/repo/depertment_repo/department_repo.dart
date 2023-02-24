import 'package:demo_domesco/models/department/department.dart';
import 'package:demo_domesco/services/dio/dio_client.dart';

class DepartmentRepo {
  static Future<List<Department>?> loadAddDepartment() async {
    List<dynamic>? res =
        await DioClient.get("departments");
    if (res != null) {
      return fromListOfMapDepartment(res);
    }
    return null;
  }
}
