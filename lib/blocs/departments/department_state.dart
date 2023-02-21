import 'package:demo_domesco/models/department/department.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DepartmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class DepartmentUnLoad extends DepartmentState {
  @override
  List<Object> get props => [UniqueKey()];
}

class DepartmentLoaded extends DepartmentState {
  final List<Department> departmentList;

  DepartmentLoaded(this.departmentList);

  @override
  List<Object> get props => [UniqueKey()];
}

class DepartmentLoadFailed extends DepartmentState {
  @override
  List<Object> get props => [UniqueKey()];
}
