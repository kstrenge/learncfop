import 'dart:convert';
import 'package:flutter/services.dart';

import '../data/json_storage.dart';
import '../data/algorithm.dart';

Future<void> welcome() async {
  initializeAlgorithms();
}

Future<void> initializeAlgorithms() async {
  const List<String> filepaths = [
    "assets/algorithms/oll2look_algorithms.json",
    "assets/algorithms/oll_algorithms.json",
    "assets/algorithms/pll2look_algorithms.json",
    "assets/algorithms/pll_algorithms.json",
  ];

  for (String filepath in filepaths) {
    final rawJson = await rootBundle.loadString(filepath);
    final Map<String, dynamic> data = jsonDecode(rawJson);

    final List<Algorithm> algorithms = [];

    for (Map<String, dynamic> jsonAlgorithm in data.values.first) {
      if (data.containsKey("oll") || data.containsKey("oll2look")) {
        algorithms.add(OLLAlgorithm.fromJson(jsonAlgorithm));
      } else if (data.containsKey("pll") || data.containsKey("pll2look")) {
        algorithms.add(PLLAlgorithm.fromJson(jsonAlgorithm));
      }
    }

    for (Algorithm algorithm in algorithms) {
      if (algorithm is OLLAlgorithm) {
        storeJson(algorithm.getId(), algorithm.toJson());
      } else if (algorithm is PLLAlgorithm) {
        storeJson(algorithm.getId(), algorithm.toJson());
      }
    }
  }
}
