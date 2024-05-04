import 'package:flutter/material.dart';

class UpdateNameTextField extends StatelessWidget {
  final TextEditingController controller;
  const UpdateNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/profile 4.png',
            width: 20,
            height: 20,
            fit: BoxFit.fill,
          ),
        ),
        hintText: "Enter New Name",
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
