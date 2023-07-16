// To parse this JSON data, do
//
//     final createEmployeeRequest = createEmployeeRequestFromJson(jsonString);

import 'dart:convert';

CreateEmployeeRequest createEmployeeRequestFromJson(String str) => CreateEmployeeRequest.fromJson(json.decode(str));

String createEmployeeRequestToJson(CreateEmployeeRequest data) => json.encode(data.toJson());

class CreateEmployeeRequest {
    String name;
    String salary;
    String age;

    CreateEmployeeRequest({
        required this.name,
        required this.salary,
        required this.age,
    });

    factory CreateEmployeeRequest.fromJson(Map<String, dynamic> json) => CreateEmployeeRequest(
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "age": age,
    };
}
