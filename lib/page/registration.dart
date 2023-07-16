import 'package:flutter/material.dart';
import 'package:flutter_project_1/helper/validation_helper.dart';
import '../widget/my_text_field.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController password = TextEditingController();

  List<DropdownMenuItem<String>> options = [
    DropdownMenuItem<String>(
      child: Text('Select'),
      value: 'select',
    ),
    DropdownMenuItem<String>(
      child: Text('Lalit'),
      value: 'lalitpur',
    )
  ];
  String selectedOption = 'select';
  String? gender = 'male';
  bool checkedValue = false;
  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _registerKey,
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  const Text("Registration",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Container(),
                ],
              ),
              const SizedBox(
                height: 72,
              ),
              MyTextField(
                controller: name,
                title: 'Name',
                validator: (val) {
                  return isEmpty(val) ?? textwithSpace(val!.trim());
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: phone,
                title: 'Phone',
                validator: (val) {
                  return isEmpty(val) ?? isMobile(val!);
                },
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        "Gender",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: 100,
                        child: ListTileTheme(
                          horizontalTitleGap: 2,
                          child: RadioListTile(
                              title: const Text('Male'),
                              contentPadding: const EdgeInsets.all(0),
                              value: 'male',
                              visualDensity:
                                  const VisualDensity(horizontal: -4),
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              }),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: 100,
                        child: ListTileTheme(
                          horizontalTitleGap: 2,
                          child: RadioListTile(
                              title: const Text('Female'),
                              contentPadding: const EdgeInsets.all(0),
                              value: 'female',
                              visualDensity:
                                  const VisualDensity(horizontal: -4),
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value.toString();
                                });
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'District',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        height: 40,
                        width: 100,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 3),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              value: selectedOption,
                              items: options,
                              onChanged: (onChange) {}),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: password,
                title: 'Password',
                obscureText: true,
                isThisPassword: false,
                
                validator: (val) {
                  return isEmpty(val) ?? checkPassword(val!.trim());
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ListTileTheme(
                horizontalTitleGap: 40,
                child: CheckboxListTile(
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  title: RichText(
                    text: const TextSpan(
                      text: 'I accept ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'terms and conditions.',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_registerKey.currentState!.validate() ==
                            checkedValue) {
                          debugPrint('register');
                        } else {
                          debugPrint('Error');
                        }
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 16),
                      ))),
            ]),
          ),
        ),
      ),
    );
  }
}
