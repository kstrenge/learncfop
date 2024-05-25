import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/pll_algorithm.dart';
import '../widgets/pll_algorithm_card.dart';
import '../widgets/pll_case_icon.dart';

Future<List<PLLAlgorithm>> loadAlgorithms() async {
  final rawJson = await rootBundle.loadString("assets/algorithms/pll_algorithms.json");
  Map<String, dynamic> data = jsonDecode(rawJson);
  List<PLLAlgorithm> algorithmList = [];
  for (Map<String, dynamic> jsonAlgorithm in data["PLL"]) {
    algorithmList.add(PLLAlgorithm.fromJson(jsonAlgorithm));
  }
  return algorithmList;
}

class PLL extends StatelessWidget {
  const PLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("PLL"))),
      body: Center(
        child: SizedBox(
          height: 200,
          child: FutureBuilder(
            future: loadAlgorithms(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PLLCaseIcon(
                  caseConfiguration: snapshot.data![0].caseConfiguration,
                  arrows: snapshot.data![0].arrows,
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
