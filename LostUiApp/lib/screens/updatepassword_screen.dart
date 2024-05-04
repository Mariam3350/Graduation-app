import 'package:flutter/material.dart';
import 'package:lostcalapp/components/bluebutton.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/Ellipse 19.png",
                )),
            Positioned(
                bottom: 123,
                child: Image.asset(
                  "assets/Ellipse 18.png",
                )),
            Positioned(bottom: 40, child: Image.asset("assets/Ellipse 17.png")),
            Positioned(bottom: 0, child: Image.asset("assets/Ellipse 16.png")),
            Positioned(
                top: 37,
                left: 160,
                child: Image.asset(
                  "assets/123 1.png",
                )),
            const Positioned(
                top: 20,
                left: 30,
                child: Column(
                  children: [
                    Text(
                      "Update",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        const Image(
                            image: AssetImage(
                                'assets/WhatsApp Image 2023-10-07 at 11.03 1 (1).png')),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  New Password',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                height: 1.1764705882352941,
                                color: Color(
                                    0xfffe9e9e9), // Adjust this color according to your need
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const PasswordComponent(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  Confirm Password',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                height: 1.1764705882352941,
                                color: Color(
                                    0xfffe9e9e9), // Adjust this color according to your need
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const PasswordComponent(),
                        const SizedBox(
                          height: 10,
                        ),
                        BlueButton(
                          text: "Change Password",
                          x: 210,
                          y: 48,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
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
