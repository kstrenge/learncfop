import 'package:flutter/material.dart';

import '../../data/json_storage.dart';
import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

Future<List<OLLAlgorithm>> loadOLLAlgorithms() async {
  List<OLLAlgorithm> algorithms = [];
  for (int i = 0; i < 21; i++) {
    final Map<String, dynamic>? json = await loadJson("oll-$i");
    if (json != null) {
      algorithms.add(OLLAlgorithm.fromJson(json));
    }
  }
  return algorithms;
}

class OLL extends StatelessWidget {
  const OLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadOLLAlgorithms(),
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
                      "Instant Orientation of Last Layer",
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
