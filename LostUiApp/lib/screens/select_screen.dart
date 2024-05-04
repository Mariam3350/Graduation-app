import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:lostcalapp/components/select_button.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff9b9b9b),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xff9b9b9b),
          items: const [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.person),
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.info_outline),
            ),
          ],
          onTap: (Indexed) {
            // Handle button tap
          },
        ),
        body: Stack(
          children: [
            Container(
              height: 159,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xfff151528),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 70,
              child: Image.asset(
                  "assets/WhatsApp Image 2023-10-07 at 11.03 2.png"),
            ),
            Positioned(
              left: 100,
              top: 85,
              child: Image.asset(
                  "assets/paint-splat-paint-splashes-design-use-abstract-vector-illus-illustration-85649903 1 (1).png"),
            ),
            Positioned(
              top: 75,
              left: 185,
              child: Image.asset("assets/lens.png"),
            ),
            Stack(
              children: [
                Positioned(
                    right: 5,
                    top: 150,
                    child: Image.asset(
                        "assets/light-blue-sky-pattern-beautiful-stars 1 (1).png")),
                Positioned(
                    right: 5,
                    top: 400,
                    child: Image.asset("assets/suspect.png")),
                Positioned(
                    right: 30,
                    top: 580,
                    child: Image.asset("assets/undraw.png")),
                Positioned(
                    left: 5,
                    top: 450,
                    child: Image.asset(
                        "assets/light-blue-sky-pattern-beautiful-stars 2.png")),
                Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const Spacer(flex: 1),
                            const SizedBox(height: 60),
                            SelectButton(text: 'Find Your Own Lost'),
                            const SizedBox(height: 40),
                            SelectButton(text: 'Add The Lost  You Found'),
                            const SizedBox(height: 40),
                            SelectButton(text: 'Search For Lost People'),
                            const SizedBox(height: 40),
                            const Spacer(flex: 1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
