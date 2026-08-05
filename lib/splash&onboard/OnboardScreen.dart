import 'package:flutter/material.dart';
import 'package:fresh_fruits_final/SignIn&Up/SignInScreen.dart';

import 'package:fresh_fruits_final/SignIn&Up/SignUpScreen.dart';


class OnboardScreen extends StatelessWidget {
  final int number;
  const OnboardScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    if (number == 0) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 123),
              child: Image.asset("assets/images/delivary.png"),
            ),

            Padding(
              padding: EdgeInsets.only(top: 132, left: 28, right: 28),
              child: Column(
                children: [
                  Text(
                    "Fast and responsibily\n delivery by our courir",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, top: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100, left: 28, right: 28),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignUpScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    "Create an account",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 28, right: 28),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (number == 1) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 135),
              child: Image.asset("assets/images/onboard.png"),
            ),Padding(
              padding: EdgeInsets.only(top: 60),
              child:Text("Welcome to Fresh Fruits",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
            ),Padding(
              padding: EdgeInsets.only(top: 24),
              child:Text("Grocery application",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
            ),Padding(
              padding: EdgeInsets.only(top: 10),
              child:Text("Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
            ),
            Padding(
              padding: EdgeInsets.only(top: 170, left: 28, right: 28),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OnboardScreen(number: 2),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xffFEC54B),
                    // side: BorderSide(color: Color(0xffFEC54B), width: 2),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 135),
              child: Image.asset("assets/images/onboard.png"),
            ),Padding(
              padding: EdgeInsets.only(top: 60),
              child:Text("We provide best quality\nFruits to your family",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            ),Padding(
              padding: EdgeInsets.only(top: 34),
              child:Text("Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150, left: 28, right: 28),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const OnboardScreen(number: 0),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Color(0xffFEC54B),
                    // side: BorderSide(color: Color(0xffFEC54B), width: 2),
                  ),
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      );
    }
  }
}
