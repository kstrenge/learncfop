import 'package:flutter/material.dart';

import '../../data/json_storage.dart';
import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

Future<List<PLLAlgorithm>> loadPLLAlgorithms() async {
  List<PLLAlgorithm> algorithms = [];
  for (int i = 0; i < 21; i++) {
    final Map<String, dynamic>? json = await loadJson("pll-$i");
    if (json != null) {
      algorithms.add(PLLAlgorithm.fromJson(json));
    }
  }
  return algorithms;
}

class PLL extends StatelessWidget {
  const PLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadPLLAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 64, bottom: 16),
                    child: Text(
                      "Instant Permutation of Last Layer",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                } else {
                  return AlgorithmCard(algorithm: snapshot.data![index - 1]);
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
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
