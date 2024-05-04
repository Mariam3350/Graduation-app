import 'package:flutter/material.dart';
import 'package:lostcalapp/components/bluebutton.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 0, left: 0, child: Image.asset("assets/Ellipse 19.png")),
            Positioned(
                bottom: 123,
                child: Image.asset(
                  "assets/Ellipse 18.png",
                )),
            Positioned(bottom: 40, child: Image.asset("assets/Ellipse 17.png")),
            Positioned(bottom: 0, child: Image.asset("assets/Ellipse 16.png")),
            Positioned(
                top: 80,
                left: 210,
                child: Image.asset(
                  "assets/undraw_Security_on_re_e491-removebg-preview 1.png",
                )),
            const Positioned(
                top: 18,
                left: 30,
                child: Column(
                  children: [
                    Text(
                      "Forget",
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
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Enter your email and we will send you a',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                height: 1.1764705882352941,
                                color: Color(
                                    0xfffbdbbbb), // Adjust this color according to your need
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'link to reset your password',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                            height: 1.1764705882352941,
                            color: Color(
                                0xfffbdbbbb), // Adjust this color according to your need
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '  Email',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 20,
                                height: 1.1764705882352941,
                                color: Color(
                                    0xffe9e9e9), // Adjust this color according to your need
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const PasswordComponent(),
                        const SizedBox(
                          height: 30,
                        ),
                        BlueButton(
                          text: "Submit",
                          x: 257,
                          y: 48,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/login");
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 20,
                                color: Color(0XFFBDBBBB),
                              ),
                              Text(
                                '  Back to log in  ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16,
                                  height: 1.1764705882352941,
                                  color: Color(
                                      0xfffbdbbbb), // Adjust this color according to your need
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
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
