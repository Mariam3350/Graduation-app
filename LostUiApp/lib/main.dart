import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lostcalapp/Bloc/authState.dart';
import 'package:lostcalapp/Bloc/lostPeopleState.dart';
import 'package:lostcalapp/Bloc/updateProfileState.dart';
import 'package:lostcalapp/screens/home_screen.dart';
import 'package:lostcalapp/screens/login_screen.dart';
import 'package:lostcalapp/screens/select_screen.dart';
import 'package:lostcalapp/screens/signup_screen.dart';
import 'package:lostcalapp/screens/updateyourname_screen.dart';
import 'package:lostcalapp/screens/updateyourpassword_screen.dart';
import 'package:lostcalapp/screens/yourfounds_screen.dart';
import 'package:lostcalapp/screens/yourlost_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) =>
            BlocProvider(create: (context) => AuthCubit(), child: LoginPage()),
        "/select": (context) => const SelectPage(),
        "/updatename": (context) => BlocProvider(
            create: (context) => UpdateProfileCubit(), child: UpdateYourName()),
        "/updatepass": (context) => BlocProvider(
            create: (context) => UpdateProfileCubit(),
            child: UpdateYourPassword()),
        "/yourLost": (context) => BlocProvider(
            create: (context) => LostPeopleCubit(),
            child: const YourLostScreen()),
        "/yourFound": (context) => BlocProvider(
            create: (context) => LostPeopleCubit(),
            child: const YourFoundsScreen())
      },
      initialRoute: "/yourLost",
    );
  }
}
