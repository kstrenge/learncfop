import 'dart:convert';
import 'package:flutter/services.dart';

import '../data/algorithm_repository.dart';
import '../data/algorithm.dart';

/// Loads all preset algorithms from the JSON files into local storage.
Future<void> initializeAlgorithms(AlgorithmRepository repository) async {
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
      jsonAlgorithm["isPinned"] = false;
      if (data.containsKey("oll") || data.containsKey("oll2look")) {
        repository.storeAlgorithm(OLLAlgorithm.fromJson(jsonAlgorithm));
      } else if (data.containsKey("pll") || data.containsKey("pll2look")) {
        repository.storeAlgorithm(PLLAlgorithm.fromJson(jsonAlgorithm));
      }
    }
  }
}
