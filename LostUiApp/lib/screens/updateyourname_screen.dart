import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostcalapp/Bloc/updateProfileState.dart';
import 'package:lostcalapp/components/customized_dialog.dart';
import 'package:lostcalapp/components/updateNameTextField.dart';

class UpdateYourName extends StatelessWidget {
  UpdateYourName({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder(
        bloc: context.read<UpdateProfileCubit>(),
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xff9b9b9b),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 290,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xff151528),
                    ),
                    child: Column(children: [
                      const Center(
                        child: Text(
                          'Update Your Name',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            height: 1.1764705882352941,
                            color: Color(
                                0xffd9d9d9), // Adjust this color according to your need
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 250,
                          child: Image.asset(
                              "assets/undraw_Updates_re_o5af (1) 1.png",
                              fit: BoxFit.contain))
                    ]),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 300,
                          width: 308,
                          decoration: const BoxDecoration(
                            color: Color(0xff151528),
                            borderRadius: BorderRadius.all(Radius.circular(27)),
                          ),
                          child: state is UpdateProfileLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(height: 20),
                                    const Image(
                                        image: AssetImage("assets/pen 8.png")),
                                    const SizedBox(height: 20),
                                    UpdateNameTextField(controller: controller),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          String username = controller.text;
                                          context
                                              .read<UpdateProfileCubit>()
                                              .updateUsername(username);
                                          if (state is UpdateProfileError) {
                                            showDialog(
                                              context: context,
                                              builder: (_) => CustomizedDialog(
                                                title: "Failed",
                                                buttonText: 'Ok',
                                                description: state.message,
                                              ),
                                            );
                                          } else if (state
                                              is UpdateProfileSuccess) {
                                            showDialog(
                                              context: context,
                                              builder: (_) =>
                                                  const CustomizedDialog(
                                                title: "Success",
                                                buttonText: 'Ok',
                                                description: "",
                                              ),
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0XFF50C0E1),
                                          elevation: 4,
                                          fixedSize: const Size(176, 53),
                                        ),
                                        child: const Text(
                                          "Update",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                        const SizedBox(height: 75),
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_circle_left,
                                size: 20,
                                color: Color(0XFF151528),
                              ),
                              Text(
                                '  Back to Profile  ',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  height: 1.1764705882352941,
                                  color: Color(
                                      0xff151528), // Adjust this color according to your need
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
