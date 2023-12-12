//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fresherfoods/src/Features/meals/presentation/home_page.dart';
import 'package:fresherfoods/src/Features/onboarding/presentation/pages/autentication_page/password_forgotten.dart';
import 'package:fresherfoods/src/Features/onboarding/presentation/pages/autentication_page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<User?> signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "User not found") {
        debugPrint("User not found for that email");
      }
    }
    return user;
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: content()),
    );
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
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.grey,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  letterSpacing: 1.4,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "User Email"),
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
                                obscureText: true,
                                cursorColor: Colors.grey,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  letterSpacing: 1.4,
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "User Password"),
                              ),
                            ),
                          ],
                        ),
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
                onTap: () async {
                  User? user = await signInWithEmail(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context,
                  );
                  // ignore: avoid_print
                  print(user);
                  if (user != null) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
