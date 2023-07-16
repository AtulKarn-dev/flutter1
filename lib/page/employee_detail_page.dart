import 'package:flutter/material.dart';
import 'package:flutter_project_1/response/employee_detail_response.dart';
import 'package:flutter_project_1/response/employee_list_response.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailPage extends StatefulWidget {
  final String id;

  const EmployeeDetailPage({super.key, required this.id});

  @override
  State<EmployeeDetailPage> createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {

  Future<EmployeeDetailResponse?> getEmployeeDetail() async {
    http.Response response = await http.get(Uri.parse(
        'https://dummy.restapiexample.com/api/v1/employee/${widget.id}'));
    if (response.statusCode == 200) {
      EmployeeDetailResponse employeeDetailResponse =
          employeeDetailResponseFromJson(response.body);
      return employeeDetailResponse;
    } else if (response.statusCode == 429) {
      return EmployeeDetailResponse(
          status: 'statusss',
          data: Data(
              id: 1,
              employeeName: 'Too many requests',
              employeeSalary: 43000,
              employeeAge: 43,
              profileImage: 'profileImage'),
          message: 'to many requests');
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Detail'),
      ),
      body: FutureBuilder<EmployeeDetailResponse?>(
        future: getEmployeeDetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'name: ${snapshot.data!.data.employeeName}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
