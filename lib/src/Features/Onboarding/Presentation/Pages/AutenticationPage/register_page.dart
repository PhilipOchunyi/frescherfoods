import 'package:flutter/material.dart';
//import 'package:fresherfoods/ui/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
        //const SizedBox(height: 40.0),
        // inputStyle("First name: ", "Jack"),
        // inputStyle("Last name: ", "Ryan"),
        // inputStyle("Email: ", "test@gmail.com"),
        // inputStyle("Password: ", "abcd12345"),
        // inputStyle("Username: ", "Jay"),
        //const SizedBox(height: 30.0),
        Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Register",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        //const SizedBox(height: 30.0),
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
