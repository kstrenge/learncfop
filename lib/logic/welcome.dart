import 'dart:convert';
import 'package:flutter/services.dart';

import '../data/algorithm.dart';
import '../data/algorithm_provider.dart';

/// Loads all preset algorithms from the JSON files into local storage.
Future<void> initializeAlgorithms() async {
  assert(algorithmProvider.isReady());

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
      jsonAlgorithm["isFavourite"] = false;
      if (data.containsKey("oll") || data.containsKey("oll2look")) {
        algorithmProvider.storeAlgorithm(OLLAlgorithm.fromJson(jsonAlgorithm));
      } else if (data.containsKey("pll") || data.containsKey("pll2look")) {
        algorithmProvider.storeAlgorithm(PLLAlgorithm.fromJson(jsonAlgorithm));
      }
    }
  }
}
