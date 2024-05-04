import 'package:flutter/material.dart';

class UpdatePasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const UpdatePasswordTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/padlock 3 (1).png',
            width: 20,
            height: 20,
            fit: BoxFit.fill,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color(0xff232334),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff50c0e1), width: 2.0),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
