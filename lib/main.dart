import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/hive_algorithm_repository.dart';
import 'data/algorithm_provider.dart';
import 'data/preferences.dart';
import 'logic/initialize_algorithms.dart';
import 'ui/theme.dart';
import 'ui/pages/home_page.dart';
import 'ui/pages/oll2look_page.dart';
import 'ui/pages/oll_page.dart';
import 'ui/pages/pll2look_page.dart';
import 'ui/pages/pll_page.dart';

void main() async {
  // start services:
  WidgetsFlutterBinding.ensureInitialized();
  makeSystemNavigationTransparent();

  Preferences.init();

  final algorithmRepository = HiveAlgorithmRepository();
  await algorithmRepository.startup();

  // initialize on first launch:
  if (await Preferences.isFirstLaunch()) {
    await initializeAlgorithms(algorithmRepository);
    await Preferences.markAsLaunchedBefore();
  }

  // start provider:
  final algorithmProvider = AlgorithmProvider(algorithmRepository);
  await algorithmProvider.loadAlgorithms();

  // start ui:
  runApp(
    ChangeNotifierProvider(
      create: (context) => algorithmProvider,
      child: const LearnCFOPApp(),
    ),
  );
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
          HomePage(),
          OLL2LookPage(),
          OLLPage(),
          PLL2LookPage(),
          PLLPage(),
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
              icon: Icon(Icons.sync, size: 22),
              label: "PLL2Look",
            ),
            NavigationDestination(
              icon: Icon(Icons.replay, size: 22),
              label: "PLL",
            ),
          ],
        ),
      ),
    );
  }
}
