import 'package:flutter/material.dart';

class PasswordComponent extends StatelessWidget {
  final TextEditingController controller;

  const PasswordComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        hintText: "Type Here",
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color(0xfff232334),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xfff50c0e1), width: 2.0),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
