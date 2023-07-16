import 'package:flutter/material.dart';
import 'package:flutter_project_1/page/employee_list_page.dart';
import 'package:flutter_project_1/widget/my_text_field.dart';
import 'package:flutter_project_1/page/registration.dart';
// import 'weather_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              const Icon(
                Icons.access_alarm_outlined,
                size: 150,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(controller: emailController, title: 'Email'),
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: passwordController,
                title: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const EmployeeList()));
                        debugPrint(emailController.text.trim());
                      },
                      child: const Text('Login'))),
              const SizedBox(
                height: 100,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Registration()));
                },
                child: Text(
                  'Create a new account',
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
