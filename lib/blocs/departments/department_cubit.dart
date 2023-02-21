import 'package:demo_domesco/blocs/departments/department_state.dart';
import 'package:demo_domesco/models/department/department.dart';
import 'package:demo_domesco/repo/depertment_repo/department_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  List<Department> _departmentList = [];

  DepartmentCubit() : super(DepartmentUnLoad());

  Future<void> loadAllDepartment() async {
    List<Department>? departmentList = await DepartmentRepo.loadAddDepartment();
    if (departmentList != null) {
      _departmentList = departmentList;
      emit(DepartmentLoaded(_departmentList));
    } else {
      emit(DepartmentLoadFailed());
    }
  }
}
