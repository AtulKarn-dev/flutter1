import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  bool obscureText;
  final bool isThisPassword;
  final TextInputType textInputType;
  String? Function(String?)? validator;

  MyTextField(
      {super.key,
      required this.controller,
      required this.title,
      this.isThisPassword = true,
      this.obscureText = false,
      this.validator,
      this.textInputType = TextInputType.text});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  // late InputDecoration inputDecoration;
  bool canLookPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Text(
                  widget.title,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                )),
            Expanded(
              flex: 7,
              child: SizedBox(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  validator: widget.validator,
                  decoration: InputDecoration(
                      suffixIcon: widget.isThisPassword
                          ? null
                          : InkWell(
                              onTap: () {
                                setState(() {
                                  canLookPassword = !canLookPassword;
                                });
                              },
                              child: canLookPassword
                                  ? const Icon(Icons.remove_red_eye_outlined)
                                  : const Icon(Icons.remove_red_eye_sharp),
                            ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorMaxLines: 3,
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  obscureText: canLookPassword,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
