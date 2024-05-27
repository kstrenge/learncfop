import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rubik App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            "WELCOME TO RUBIK, \n YOUR SPEEDCUBE MEMORY AID",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
