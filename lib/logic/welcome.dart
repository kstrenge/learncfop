import 'dart:convert';
import 'package:flutter/services.dart';

import '../data/algorithm.dart';
import '../data/local_store_old.dart';

Future<void> welcome() async {
  // implement check if first time using the app
  await openDB();
  await _initializeAlgorithms();
}

/// Loads all preset algorithms from the JSON files into local storage.
Future<void> _initializeAlgorithms() async {
  const List<String> files = [
    "assets/algorithms/oll2look_algorithms.json",
    "assets/algorithms/oll_algorithms.json",
    "assets/algorithms/pll2look_algorithms.json",
    "assets/algorithms/pll_algorithms.json",
  ];

  for (String file in files) {
    final rawJson = await rootBundle.loadString(file);
    final Map<String, dynamic> data = jsonDecode(rawJson);

    for (Map<String, dynamic> jsonAlgorithm in data.values.first) {
      if (data.containsKey("oll") || data.containsKey("oll2look")) {
        storeAlgorithm(OLLAlgorithm.fromMap(jsonAlgorithm));
      } else if (data.containsKey("pll") || data.containsKey("pll2look")) {
        storeAlgorithm(PLLAlgorithm.fromMap(jsonAlgorithm));
      }
    }
  }
}
