import 'package:flutter/material.dart';
import 'package:flutter_project_1/page/create_employee_page.dart';
import 'package:flutter_project_1/page/employee_detail_page.dart';
import 'package:flutter_project_1/response/employee_list_response.dart';
import 'package:http/http.dart' as http;

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  late Future<List<Datum>?> futureEmployee;

  Future<List<Datum>?> getEmployee() async {
    http.Response response = await http
        .get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
    if (response.statusCode == 200) {
      EmployeeListResponse employeeResponse =
          employeeListResponseFromJson(response.body);
      return employeeResponse.data;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureEmployee = getEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.blue, title: Text('Employee List')),
      body: FutureBuilder<List<Datum>?>(
          future: futureEmployee,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    Datum data = snapshot.data![index];

                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                EmployeeDetailPage(
                                  id: data.id.toString(),
                                )));
                      },
                      leading: Text((index + 1).toString()),
                      subtitle: Text('age: ${data.employeeAge}'),
                      title: Text(data.employeeName),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const CreateEmployeePage()));
        },
      ),
    );
  }
}
