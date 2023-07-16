// To parse this JSON data, do
//
//     final employeeDetailResponse = employeeDetailResponseFromJson(jsonString);

import 'dart:convert';

EmployeeDetailResponse employeeDetailResponseFromJson(String str) => EmployeeDetailResponse.fromJson(json.decode(str));

String employeeDetailResponseToJson(EmployeeDetailResponse data) => json.encode(data.toJson());

class EmployeeDetailResponse {
    String status;
    Data data;
    String message;

    EmployeeDetailResponse({
        required this.status,
        required this.data,
        required this.message,
    });

    factory EmployeeDetailResponse.fromJson(Map<String, dynamic> json) => EmployeeDetailResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;
    String profileImage;

    Data({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
        required this.profileImage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
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
