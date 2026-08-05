import 'package:flutter/material.dart';
import 'package:fresh_fruits_final/Home/HomeScreen.dart';

import 'CustomTextField.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";
  String password = "";

  final TextEditingController
  emailController = TextEditingController(),
  passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/sing-in.png",
            width: double.infinity,
            height: 440,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: 420),
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
                          "Sing In",
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
                            onPressed: () {
                              emailController.clear();
                              passwordController.clear();
                            },
                            icon: Icon(Icons.close_rounded),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),

                    CustomTextField(
                      controller: emailController,
                      hintText: "hala@gmail.com",
                      onValueChanged: (value) {
                        setState(() {
                          email = value;
                          print(email);
                        });
                      },
                    ),
                    SizedBox(height: 13),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "password",
                      onValueChanged: (value) {
                        setState(() {
                          password = value;
                          print(password);
                        });
                      },
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFEC54B),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40, left: 28, right: 28),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: FilledButton(
                          onPressed: () {
                            if(email != "" && password != "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Congratulation!!!!'),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => HomeScreen()
                                ),
                              );
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Check if complete all Information!'),
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );

                            }
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xffFEC54B),
                          ),
                          child: Text(
                            "SIGN IN",
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

