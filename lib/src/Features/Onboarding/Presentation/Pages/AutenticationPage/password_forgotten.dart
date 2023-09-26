import 'package:flutter/material.dart';

class PasswordForgottenPage extends StatefulWidget {
  const PasswordForgottenPage({super.key});

  @override
  State<PasswordForgottenPage> createState() => _PasswordForgottenPageState();
}

class _PasswordForgottenPageState extends State<PasswordForgottenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: content()),
    );
  }

  Widget content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 290,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.elliptical(80, 80),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Image.asset(
                  "./assets/images/group.png",
                  scale: 2,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Find your account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40.0),
        Container(
          padding: const EdgeInsets.only(right: 50.0),
          child: const Text(
            "Enter your username or email",
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.only(right: 65.0),
          child: const Text(
            "Can't reset your password?",
            style: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
          ),
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: const EdgeInsets.only(left: 10.0),
            ),
          ),
        ),
        const SizedBox(height: 40.0),
        Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Find account",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Back to log in",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
