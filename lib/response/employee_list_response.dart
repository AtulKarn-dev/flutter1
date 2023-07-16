// To parse this JSON data, do
//
//     final employeeListResponse = employeeListResponseFromJson(jsonString);

import 'dart:convert';

EmployeeListResponse employeeListResponseFromJson(String str) => EmployeeListResponse.fromJson(json.decode(str));

String employeeListResponseToJson(EmployeeListResponse data) => json.encode(data.toJson());

class EmployeeListResponse {
    String status;
    List<Datum> data;
    String message;

    EmployeeListResponse({
        required this.status,
        required this.data,
        required this.message,
    });

    factory EmployeeListResponse.fromJson(Map<String, dynamic> json) => EmployeeListResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;
    String profileImage;

    Datum({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
        required this.profileImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_salary": employeeSalary,
        "employee_age": employeeAge,
        "profile_image": profileImage,
    };
}
