import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_page.dart';
import '../widgets/algorithm_card.dart';

class PLL extends StatelessWidget {
  final List<Algorithm> algorithms;
  const PLL({super.key, required this.algorithms});

  @override
  Widget build(BuildContext context) {
    return AlgorithmPage(
        title: "Instant Permutation of Last Layer",
        algorithmSliverList: SliverList.separated(
          itemCount: algorithms.length,
          itemBuilder: (context, index) =>
              AlgorithmCard(algorithm: algorithms[index]),
          separatorBuilder: (context, index) => SizedBox(height: 16),
        ),
        hasError: algorithms.isEmpty);
  }
}
