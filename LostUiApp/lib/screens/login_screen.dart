import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:lostcalapp/Bloc/authState.dart';
import 'package:lostcalapp/components/bluebutton.dart';
import 'package:lostcalapp/components/customized_dialog.dart';
import 'package:lostcalapp/components/emailComponent.dart';
import 'package:lostcalapp/components/passwordComponent.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraint) {
            return BlocBuilder(
              bloc: context.read<AuthCubit>(),
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset("assets/Ellipse 19.png")),
                      Positioned(
                          bottom: 123,
                          child: Image.asset("assets/Ellipse 18.png")),
                      Positioned(
                          bottom: 40,
                          child: Image.asset("assets/Ellipse 17.png")),
                      Positioned(
                          bottom: 0,
                          child: Image.asset("assets/Ellipse 16.png")),
                      Positioned(
                          top: 37,
                          left: 160,
                          child: Image.asset("assets/remove 1.png")),
                      const Positioned(
                          top: 20,
                          left: 30,
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Center(
                              child: Column(
                                children: [
                                  const Spacer(flex: 1),
                                  const Image(
                                      image: AssetImage(
                                          'assets/WhatsApp Image 2023-10-07 at 11.03 1 (1).png')),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                          height: 1.1764705882352941,
                                          color: Color(
                                              0xffe9e9e9), // Adjust this color according to your need
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  EmailComponent(controller: emailController),
                                  const SizedBox(height: 10),
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 18,
                                          height: 1.1764705882352941,
                                          color: Color(
                                              0xffe9e9e9), // Adjust this color according to your need
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  PasswordComponent(
                                      controller: passwordController),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, "/login");
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Forget Password?',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            height: 1.1764705882352941,
                                            color: Color(
                                                0xffbdbbbb), // Adjust this color according to your need
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  BlueButton(
                                    text: "Login",
                                    x: 150,
                                    y: 48,
                                    onTap: () {
                                      final email = emailController.text;
                                      final password = passwordController.text;

                                      context
                                          .read<AuthCubit>()
                                          .signIn(email, password);
                                      if (state is AuthError) {
                                        print(state.message);
                                      }
                                      if (state is AuthSuccess) {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              const CustomizedDialog(
                                            title: "Success",
                                            buttonText: 'Ok',
                                            description: "",
                                          ),
                                        );
                                        Navigator.pushNamed(context, '/select');
                                      } else if (state is AuthError) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => CustomizedDialog(
                                            title: "Failed",
                                            buttonText: 'Ok',
                                            description: state.message,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
