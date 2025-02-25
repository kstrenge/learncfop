import 'package:flutter/material.dart';

import '../../data/json_storage.dart';
import '../../data/algorithm.dart';
import '../../ui/widgets/algorithm_card.dart';

Future<List<OLLAlgorithm>> loadOLL2LookAlgorithms() async {
  List<OLLAlgorithm> algorithms = [];
  for (int i = 0; i < 10; i++) {
    final Map<String, dynamic>? json = await loadJson("oll2look-$i");
    if (json != null) {
      algorithms.add(OLLAlgorithm.fromJson(json));
    }
  }
  return algorithms;
}

class OLL2Look extends StatelessWidget {
  const OLL2Look({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadOLL2LookAlgorithms(),
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
                  return AlgorithmCard(algorithm: snapshot.data![index - 1]);
                } else if (index == 4) {
                  return const Text("Step 2 - Edges:");
                } else {
                  return AlgorithmCard(algorithm: snapshot.data![index - 2]);
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
