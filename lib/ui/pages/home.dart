import 'package:flutter/material.dart';

import 'info.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn CFOP App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Info()),
            ),
            icon: const Icon(Icons.info_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Text("WELCOME TO LEARN CFOP, \n YOUR SPEEDCUBE MEMORY AID",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge),

                Text(
                  "Find the solving algorithms in the \n tabs at the bottom",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                const Icon(Icons.arrow_downward, size: 30),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
