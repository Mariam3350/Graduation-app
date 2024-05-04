import 'package:flutter/material.dart';

class EmailComponent extends StatelessWidget {
  final TextEditingController controller;
  const EmailComponent({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.grey),
      controller: controller,
      decoration: InputDecoration(
        hintText: "Type Your Email",
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff50c0e1), width: 2.0),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
    );
  }
}
