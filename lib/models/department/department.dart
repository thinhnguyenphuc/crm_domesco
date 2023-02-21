List<Department> fromListOfMapDepartment(List<dynamic> list) {
  return list.map((e) => fromMap(e)).toList();
}

Department fromMap(Map<String, dynamic> map) {
  return Department(
      id: map["id"],
      name: map["name"],
      fullName: map["fullName"],
      province: map["province"],
      region: map["region"]);
}

class Department {
  Department({
    required this.id,
    required this.name,
    required this.fullName,
    required this.province,
    required this.region,
  });

  final String id;
  final String name;
  final String? fullName;
  final String? province;
  final String? region;
}
