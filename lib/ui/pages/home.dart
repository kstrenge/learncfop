import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rubik App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Text("WELCOME TO RUBIK, \n YOUR SPEEDCUBE MEMORY AID", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 16),
                ClipRect(
                  child: Align(
                    heightFactor: 0.5,
                    child: Image.asset(
                      width: 300,
                      "assets/icon/icon_foreground.png",
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  "Find the solving algorithms in the \n tabs at the bottom",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                const Icon(Icons.arrow_downward, size: 30),
                // const Spacer(),
                const SizedBox(height: 64),
                const Text("made by koncode"),
                const SizedBox(height: 16),
                TextButton.icon(
                  label: const Text("Open Source Licences"),
                  icon: const Icon(Icons.open_in_browser),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const LicensePage()),
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
