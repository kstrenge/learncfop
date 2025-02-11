import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Info")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          const SizedBox(height: 64, width: double.infinity),
          const Text("made by koncode"),
          const SizedBox(height: 16),
          TextButton.icon(
            label: const Text("Link to GitHub"),
            icon: const FaIcon(FontAwesomeIcons.github),
            style: coloredButtonStyle(Theme.of(context).colorScheme.onSurface),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text("Report Bug"),
            icon: const FaIcon(Icons.bug_report),
            style: coloredButtonStyle(Theme.of(context).colorScheme.error),
            onPressed: () {},
          ),
          TextButton.icon(
            label: const Text("Suggest Feature"),
            icon: const FaIcon(Icons.lightbulb),
            style: coloredButtonStyle(Theme.of(context).colorScheme.tertiary),
            onPressed: () {},
          ),
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
    );
  }
}
