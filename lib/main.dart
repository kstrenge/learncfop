import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'ui/theme.dart';
import 'ui/pages/home.dart';
import 'ui/pages/oll.dart';
import 'ui/pages/oll2look.dart';
import 'ui/pages/pll.dart';

void main() {
  makeSystemNavigationTransparent();
  runApp(const RubikApp());
}

class RubikApp extends StatefulWidget {
  const RubikApp({super.key});

  @override
  State<RubikApp> createState() => _RubikAppState();
}

class _RubikAppState extends State<RubikApp> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(context),
      home: Scaffold(
        body: [const Home(), const OLL2Look(), const OLL(), const PLL()][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) => setState(() => currentPageIndex = index),
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Symbols.keyboard_double_arrow_up),
              label: "OLL2Look",
            ),
            NavigationDestination(
              icon: Icon(Symbols.keyboard_arrow_up),
              label: "OLL",
            ),
            NavigationDestination(
              icon: Icon(Symbols.cycle),
              label: "PLL",
            ),
          ],
        ),
      ),
    );
  }
}

void navigateTo(Widget destinationPage, BuildContext context) {
  final MaterialPageRoute route = MaterialPageRoute(builder: (_) => destinationPage);
  Navigator.push(context, route);
}
