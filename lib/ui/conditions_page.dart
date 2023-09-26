import 'package:flutter/material.dart';

class ConditionsPage extends StatelessWidget {
  const ConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & conditions"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
