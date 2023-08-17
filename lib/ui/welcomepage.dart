import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "./assets/images/group.png",
              height: 180.0,
              width: 180.0,
              
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}
