import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

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
      appBar: AppBar(
        title: const FittedBox(child: Text("Instant Permutation of Last Layer")),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: loadAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AlgorithmCard.pll(snapshot.data![index]);
              },
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
