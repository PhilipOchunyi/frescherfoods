import 'package:flutter/material.dart';
//import 'package:fresherfoods/src/Features/Onboarding/Presentation/Pages/login.dart';

import '../AutenticationPage/login.dart';
//import 'package:fresherfoods/ui/login.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    //startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 7, 44, 107),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),

        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 350.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    Image.asset("./assets/images/group.png"),
                  ],
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      height: 50.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: const Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

//       child: Image.asset(
//         "./assets/images/group.png",
//         scale: 2,
//       ),
//         ],
      ),
    );
  }
}
