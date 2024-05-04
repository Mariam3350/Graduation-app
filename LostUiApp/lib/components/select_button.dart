import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  SelectButton({super.key, this.text});

  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: const Color(0XFF151528),
        side: const BorderSide(width: 1, color: Color(0XFF50C0E1)),
        elevation: 3,
        fixedSize: const Size(250, 80),
      ),
      child: Text(
        text!,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    );
  }
}
