import 'package:flutter/material.dart';
import 'package:fresh_fruits_final/Home/HomeScreen.dart';
import 'package:fresh_fruits_final/SignIn&Up/CustomTextField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String f_name = "";
  String l_name = "";
  String email = "";
  String password = "";

  final TextEditingController
    firstNameController = TextEditingController(),
    lastNameController = TextEditingController(),
    emailController = TextEditingController(),
    passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
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
                            onPressed: () {
                              firstNameController.clear();
                              lastNameController.clear();
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
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: firstNameController,
                            hintText: "Hala",
                            onValueChanged: (value) {
                              setState(() {
                                f_name = value;
                                print(f_name);
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: lastNameController,
                            hintText: "Dalloul",
                            onValueChanged: (value) {
                              setState(() {
                                l_name = value;
                                print(l_name);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
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
                    Text(
                      "By tapping Sign up you accept all\nterms and condition",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70, left: 28, right: 28),
                      child: SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: FilledButton(
                          onPressed: () {
                            if (f_name != "" &&
                                l_name != "" &&
                                email != "" &&
                                password != "") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Check if complete all Information!',
                                  ),
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
