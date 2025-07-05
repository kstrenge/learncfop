import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

class OLL2Look extends StatelessWidget {
  final List<Algorithm> algorithms;
  const OLL2Look({super.key, required this.algorithms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: algorithms.isEmpty
          ? Center(
              child: Text(
                  "Error while loading algorithms. Reset algorithms in settings."),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: algorithms.length + 2,
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
                  return AlgorithmCard(algorithm: algorithms[index - 1]);
                } else if (index == 4) {
                  return const Text("Step 2 - Edges:");
                } else {
                  return AlgorithmCard(algorithm: algorithms[index - 2]);
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            ),
    );
  }
}
