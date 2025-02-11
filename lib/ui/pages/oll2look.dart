import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

Future<List<OLLAlgorithm>> loadAlgorithms() async {
  final rawJson =
      await rootBundle.loadString("assets/algorithms/oll2look_algorithms.json");
  Map<String, dynamic> data = jsonDecode(rawJson);
  List<OLLAlgorithm> algorithmList = [];
  for (Map<String, dynamic> jsonAlgorithm in data["OLL2Look"]) {
    algorithmList.add(OLLAlgorithm.fromJson(jsonAlgorithm));
  }
  return algorithmList;
}

class OLL2Look extends StatelessWidget {
  const OLL2Look({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64, bottom: 16),
                        child: Text(
                          "Orientation of Last Layer in 2 steps",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      Text("Step 1 - Corners:"),
                    ],
                  );
                } else if (index > 0 && index < 4) {
                  return AlgorithmCard.oll(snapshot.data![index - 1]);
                } else if (index == 4) {
                  return const Text("Step 2 - Edges:");
                } else {
                  return AlgorithmCard.oll(snapshot.data![index - 2]);
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
