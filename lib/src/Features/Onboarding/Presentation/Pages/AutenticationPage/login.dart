import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/AutenticationPage/password_forgotten.dart';
import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/AutenticationPage/register_page.dart';
//import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/Screen/homepage.dart';

import '../../../../../../ui/conditions_page.dart';
import '../../Screens/home_page.dart';
//import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/password_forgotten.dart';
//import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/register_page.dart';
//import 'package:fresherfoods/ui/password_forgotten.dart';
// 'package:fresherfoods/ui/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;
  Map userData = {};
  bool isChecked = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: content()),
    );
  }

  void successfulLogin() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        isChecked) {
      Navigator.pushReplacementNamed(context, '/homepage');

      print("success");
    } else {
      print("Login unsuccessful. Check your datails");
    }
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        key: _formKey,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(80, 80),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                "./assets/images/group.png",
                scale: 2,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 100,
            width: 280,
            //color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.center,
            child: const Text(
              "Welcome back to Fresher Foods. Sign in, for better and healthier eating.",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 2.0,
                    blurRadius: 20.0,
                    offset: const Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Positioned(
                    top: 10.0,
                    left: 20.0,
                    child: Text(
                      "Please login in here ",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 20.0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.mail_outline,
                              color: Colors.grey,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              width: 300,
                              child: TextFormField(
                                controller: _emailController,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter your email';
                                //   }
                                //   if (!value.contains("@")) {
                                //     return "Please Enter Valid Email ";
                                //   }
                                //   return null;
                                // },
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.grey,
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "example@gmail.com"),
                              ),
                            ),
                          ],
                        ),
                  
                      ],
                    ),
                  ),
                  Positioned(
                    top: 120.0,
                    left: 20.0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              width: 300,
                              child: TextFormField(
                                controller: _passwordController,
                                // validator: (value) {
                                //   print("hi");
                                //   if (value == null || value.isEmpty) {
                                //     return 'Please enter your password';
                                //   }
                                //   return null;
                                // },
                                //if (password == null || password.isEmpty) {
                                //     return 'Please enter your password';
                                //   }
                                //   return null;
                                // },
                                obscureText: true,
                                cursorColor: Colors.grey,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  letterSpacing: 1.4,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password"),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(
                        //   width: 360,
                        //   child: Divider(color: Colors.grey),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          RichText(
            text: TextSpan(
              text: "Forgotten your password?", //TO DO
              style: const TextStyle(color: Colors.blueAccent, fontSize: 15.0),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PasswordForgottenPage()));
                },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                Container(
                  width: 280,
                  height: 50,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "By pressing log in you agree to our ", //TO DO
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 15.0),
                      children: [
                        TextSpan(
                          text: "terms & conditions ",
                          //TO DO
                          style: const TextStyle(
                              color: Colors.blueAccent, fontSize: 15.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ConditionsPage()));
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //const SizedBox(height: 1.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  print("Buttom");
                  if (_emailController.text.isEmpty) {
                    //return "Please enter your email";
                    print("Enter email");
                  } else if (!_emailController.text.contains("@")) {
                    //return "Please Enter Valid Email ";
                    print("Enter email with @");
                  } else {
                    print("Email correct");
                  }

                  if (_passwordController.text.isEmpty) {
                    //return "Please enter your email";
                    print("Enter password");
                  } else {}

                  successfulLogin();

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },

        

                child: const Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 15.0,
                  ),
                ),
                TextSpan(
                  text: "Register",
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueAccent,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget inputStyle(String title, String hintext) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
    child: Row(
      children: [
        Text(
          "$title : ",
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2.0,
                  blurRadius: 5.0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10.0),
                hintText: hintext,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
