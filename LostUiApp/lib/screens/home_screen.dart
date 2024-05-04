import 'package:flutter/material.dart';
import 'package:lostcalapp/components/bluebutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(top: 10, child: Image.asset("assets/appLogo.png")),
            Positioned(
                top: 115,
                right: 132,
                child: Image.asset("assets/splashed.png")),
            Positioned(
                top: 270, left: 290, child: Image.asset("assets/suspect.png")),
            Positioned(
                left: 0,
                right: 0,
                bottom: 123,
                child: Image.asset("assets/Ellipse 5.png")),
            Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Image.asset("assets/Ellipse 4.png")),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset("assets/Ellipse 1.png")),
            Stack(
              children: [
                Positioned(
                    left: 40,
                    top: 500,
                    child: Image.asset("assets/Group 2.png")),
                Positioned(
                    left: 70,
                    top: 538,
                    child: Image.asset("assets/Ellipse 15.png")),
                Positioned(
                    left: 40,
                    top: 545,
                    child: Image.asset("assets/Ellipse 9.png")),
                Positioned(
                    left: 135,
                    top: 500,
                    child: Image.asset("assets/Group 1.png")),
                Positioned(
                    left: 230,
                    top: 510,
                    child: Image.asset("assets/Line 1.png")),
                Positioned(
                    left: 224,
                    top: 500,
                    child: Image.asset("assets/Ellipse 175.png")),
                Positioned(
                    right: 0,
                    top: 510,
                    child: Image.asset("assets/flower.png")),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'Find The Lost',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          height: 1.1764705882352941,
                          color: Colors
                              .black, // Adjust this color according to your need
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'SAVE',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 21,
                          height: 1.1764705882352941,
                          color: Colors
                              .black, // Adjust this color according to your need
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'The Day',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.5,
                          height: 1.1764705882352941,
                          color: Colors
                              .black, // Adjust this color according to your need
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlueButton(
                        text: "Login",
                        x: 150,
                        y: 48,
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      OutlinedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, "/signup"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0XFF509BE1),
                          side: const BorderSide(color: Colors.blue, width: 3),
                          elevation: 4,
                          fixedSize: const Size(150, 48),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
