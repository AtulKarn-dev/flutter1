// To parse this JSON data, do
//
//     final createEmployeeResponse = createEmployeeResponseFromJson(jsonString);

import 'dart:convert';

CreateEmployeeResponse createEmployeeResponseFromJson(String str) => CreateEmployeeResponse.fromJson(json.decode(str));

String createEmployeeResponseToJson(CreateEmployeeResponse data) => json.encode(data.toJson());

class CreateEmployeeResponse {
    String status;
    Data data;

    CreateEmployeeResponse({
        required this.status,
        required this.data,
    });

    factory CreateEmployeeResponse.fromJson(Map<String, dynamic> json) => CreateEmployeeResponse(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String name;
    String salary;
    String age;
    int id;

    Data({
        required this.name,
        required this.salary,
        required this.age,
        required this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        salary: json["salary"],
        age: json["age"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "salary": salary,
        "age": age,
        "id": id,
    };
}
