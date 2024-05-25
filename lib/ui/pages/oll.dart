import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/oll_algorithm.dart';
import '../widgets/oll_algorithm_card.dart';

Future<List<OLLAlgorithm>> loadAlgorithms() async {
  final rawJson = await rootBundle.loadString("assets/oll_algorithms.json");
  Map<String, dynamic> data = jsonDecode(rawJson);
  List<OLLAlgorithm> algorithmList = [];
  for (Map<String, dynamic> jsonAlgorithm in data["OLL"]) {
    algorithmList.add(OLLAlgorithm.fromJson(jsonAlgorithm));
  }
  return algorithmList;
}

class OLL extends StatelessWidget {
  const OLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Instant Orientation of Last Layer"),
        ),
      ),
      body: FutureBuilder(
        future: loadAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AlgorithmCard(snapshot.data![index]);
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
