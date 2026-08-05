import 'package:flutter/material.dart';
import 'package:fresh_fruits_final/SignIn&Up/CustomTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/sing-up.png",
            width: double.infinity,
            height: 389,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 340),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 28, right: 28, top: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Create your account",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.close_rounded),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(hintText: "Hala"),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(hintText: "Dalloul"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CustomTextField(hintText: "hala@gmail.com"),
                    SizedBox(height: 13,),
                    CustomTextField(hintText: "password", suffixIcon: Icon(Icons.remove_red_eye_rounded),),
                    SizedBox(height: 20),
                    Text("By tapping Sign up you accept all\nterms and condition",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 28, right: 28),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: FilledButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => const (number: 2),
                            //   ),
                            // );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xffFEC54B),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
