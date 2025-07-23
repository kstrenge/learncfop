import 'package:flutter/material.dart';

import 'data/algorithm_store.dart';
import 'logic/welcome.dart';
import 'ui/theme.dart';
import 'ui/pages/home.dart';
import 'ui/pages/oll2look.dart';
import 'ui/pages/oll.dart';
import 'ui/pages/pll2look.dart';
import 'ui/pages/pll.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  makeSystemNavigationTransparent();
  await algorithmStore.startup();
  // TODO: überprüfen ob erster Start:
  initializeAlgorithms();
  runApp(const LearnCFOPApp());
}

class LearnCFOPApp extends StatefulWidget {
  const LearnCFOPApp({super.key});

  @override
  State<LearnCFOPApp> createState() => _LearnCFOPAppState();
}

class _LearnCFOPAppState extends State<LearnCFOPApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      home: Scaffold(
        body: [
          Home(favourites: algorithmStore.loadFavouriteAlgorithms()),
          OLL2Look(algorithms: algorithmStore.loadAlgorithms("oll2look")),
          OLL(algorithms: algorithmStore.loadAlgorithms("oll")),
          PLL2Look(algorithms: algorithmStore.loadAlgorithms("pll2look")),
          PLL(algorithms: algorithmStore.loadAlgorithms("pll")),
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) =>
              setState(() => currentPageIndex = index),
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.keyboard_double_arrow_up),
              label: "OLL2Look",
            ),
            NavigationDestination(
              icon: Icon(Icons.keyboard_arrow_up),
              label: "OLL",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.sync,
                size: 22,
              ),
              label: "PLL2Look",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.replay,
                size: 22,
              ),
              label: "PLL",
            ),
          ],
        ),
      ),
    );
  }
}
