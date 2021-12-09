

import 'dart:convert';

Employee employeeModelFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeModelToJson(Employee data) => json.encode(data.toJson());





class Employee {
  String? name;
  String? address;

  Employee({this.name, this.address});

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    return data;
  }
}