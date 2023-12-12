import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import '../../../../../../ui/conditions_page.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late bool success;
  late String userEmail;

  bool isChecked = false;

  Future register() async {
    final User? user = (await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;

    if (user != null && !isChecked) {
      setState(() {
        success = true;
        userEmail = user.email!;
      });
    } else {
      setState(() {
        success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: content()),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        // key: _formKey,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          const SizedBox(height: 50.0),
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
                      "Please register here ",
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
                                controller: emailController,
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
                                controller: passwordController,
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
          Container(
            child: Row(
              children: [
                Material(
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
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
          const SizedBox(height: 1.0),
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
                  register();
                },
                child: Container(
                  child: const Center(
                    child: Text(
                      "Register",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
}
