import 'package:flutter/material.dart';

class BabyBlueButton extends StatelessWidget {
  BabyBlueButton({super.key, this.onTap,required this.y, required this.x, this.text,});
  String? text;
  double x,y;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onTap! ,

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF50C0E1),

        elevation: 4,
        fixedSize: Size( x, y),
      ),
      child:  Text(  text!,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      ),
    );
  }
}



