import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme.dart';
import '../widgets/easter_egg.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Info")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            EasterEgg(),
            const SizedBox(height: 32, width: double.infinity),
            const Text("made by kstrenge"),
            const SizedBox(height: 32),
            TextButton.icon(
              label: const Text("Link to GitHub"),
              icon: const FaIcon(FontAwesomeIcons.github),
              style: coloredButtonStyle(
                Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: () {},
            ),
            TextButton.icon(
              label: const Text("Report bug / error"),
              icon: const FaIcon(Icons.bug_report),
              style: coloredButtonStyle(Theme.of(context).colorScheme.error),
              onPressed: () {},
            ),
            TextButton.icon(
              label: const Text("Suggest feature"),
              icon: const FaIcon(Icons.lightbulb),
              style: coloredButtonStyle(Theme.of(context).colorScheme.primary),
              onPressed: () {},
            ),
            Spacer(),
            Text("Version 2.0"),
            TextButton.icon(
              label: const Text("Open Source Licences"),
              icon: const Icon(Icons.description),
              style: coloredButtonStyle(Theme.of(context).colorScheme.tertiary),
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
    );
  }
}
