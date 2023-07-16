import 'package:flutter/material.dart';
import 'package:flutter_project_1/helper/validation_helper.dart';
import 'package:flutter_project_1/request/create_employee_request.dart';
import 'package:flutter_project_1/response/create_employee_response.dart';
import 'package:flutter_project_1/widget/my_text_field.dart';
import 'package:http/http.dart' as http;

class CreateEmployeePage extends StatefulWidget {
  const CreateEmployeePage({super.key});

  @override
  State<CreateEmployeePage> createState() => _CreateEmployeePageState();
}

class _CreateEmployeePageState extends State<CreateEmployeePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  final _createEmployeeKey = GlobalKey<FormState>();

  Future<CreateEmployeeResponse?> createEmployee() async {
    if (_createEmployeeKey.currentState!.validate()) {
      http.Response response = await http.post(
          Uri.parse('https://dummy.restapiexample.com/api/v1/create'),
          body: createEmployeeRequestToJson(CreateEmployeeRequest(
              name: nameController.text.trim(),
              salary: salaryController.text.trim(),
              age: ageController.text.trim())));

      if (response.statusCode == 200) {
        CreateEmployeeResponse createEmployeeResponse =
            createEmployeeResponseFromJson(response.body);
        return createEmployeeResponse;
      }
    }
  }

  SizedBox sizedBoxOne = const SizedBox(
    height: 25,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create Employee'), automaticallyImplyLeading: true),
      body: Form(
          key: _createEmployeeKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              MyTextField(
                controller: nameController,
                title: 'Name',
                isThisPassword: true,
                validator: (val) {
                  return isEmpty(val!.trim()) ?? textwithSpace(val!);
                },
              ),
              sizedBoxOne,
              MyTextField(
                controller: ageController,
                title: 'Age',
                isThisPassword: true,
                textInputType: TextInputType.number,
                validator: (val) {
                  return isEmpty(val!.trim()) ?? onlyNumber(val!.trim());
                },
              ),
              sizedBoxOne,
              MyTextField(
                controller: salaryController,
                title: 'Salary',
                isThisPassword: true,
                textInputType: TextInputType.number,
                validator: (val) {
                  return isEmpty(val!.trim()) ?? onlyNumber(val!.trim());
                },
              ),
              Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        createEmployee();
                      },
                      child: Text('Create'))),
              Spacer(),
            ],
          )),
    );
  }
}
