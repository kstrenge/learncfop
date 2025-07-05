import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';

class OLL extends StatelessWidget {
  final List<Algorithm> algorithms;
  const OLL({super.key, required this.algorithms});

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
              itemCount: algorithms.length + 1,
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
                  return AlgorithmCard(algorithm: algorithms[index - 1]);
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            ),
    );
  }
}
