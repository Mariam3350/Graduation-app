import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      backgroundColor: const Color(0xfff9b9b9b),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xfff9b9b9b),
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

          Positioned(
          top: 0,
          child: Image.asset("assets/Rectangle 16.png")),
        Positioned(
            top: 256,
            left: 247,
            child: Image.asset("assets/question (1) 1.png")),
        Positioned(
            top: 558,
            left: 225,
            child: Image.asset("assets/undraw_Online_information.png")),
        Positioned(
            top: 560,
            left: 16,
            child: Image.asset("assets/undraw_Faq.png")),
        const Padding(padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(height: 310,),
              Row(
                children: [
                  Icon(Icons.circle_sharp,color: Color(0XFF151528),size: 40,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),
                      Text("App and website help you to find lost people",style: TextStyle(
                        fontSize: 14.5,
                        color: Color(0XFF151528),

                      ),),
                      Text("by computer vision with cameras and authors",style: TextStyle(
                        fontSize: 14.5,
                        color: Color(0XFF151528),

                      ),),
                      Text("then send to you all information about the lost .",style: TextStyle(
                        fontSize: 14.5,
                        color: Color(0XFF151528),

                      ),),
                    ],
                  ),
                ],
              ),
              SizedBox(height:20,),
              Row( children: [
                Icon(Icons.circle_sharp,color: Color(0XFF151528),size: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:15,),
                    Text("We seek to expand the surveillance",style: TextStyle(
                      fontSize: 14.5,
                      color: Color(0XFF151528),

                    ),),
                    Text("network to all countries.",style: TextStyle(
                      fontSize: 14.5,
                      color: Color(0XFF151528),

                    ),),

                  ],
                ),
              ],),
              SizedBox(height: 20,),
              Row(
                children: [
                  Icon(Icons.circle_sharp,color: Color(0XFF151528),size: 40,),
                  Text("Find The Lost , SAVE The Day .",style: TextStyle(
                    fontSize: 14.5,
                    color: Color(0XFF151528),
                    fontWeight: FontWeight.bold,

                  ),),

                ],
              ),
            ],
          ),),


        Stack(
          children: [
            Positioned(
                top: 0,
                left: 39,
                child: Image.asset("assets/LOSTCAL.png",width: 331,height: 150,)),
            Positioned(
                top: 90,
                left: 56.38,
                child: Image.asset("assets/lovepik.png")),
            Positioned(
                top: 90,
                left: 56.38,
                child: Image.asset("assets/lovepik.png")),
            Positioned(
                top: 140,
                left: 262,
                child: Image.asset("assets/search 1.png")),

          ],
        ),
     ],),

     ),);
  }
}
