import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_page.dart';
import '../widgets/algorithm_card.dart';

class PLL2Look extends StatelessWidget {
  final List<Algorithm> algorithms;
  const PLL2Look({super.key, required this.algorithms});

  @override
  Widget build(BuildContext context) {
    return AlgorithmPage(
      title: "Permutation of Last Layer in 2 steps",
      algorithmSliverList: SliverList.separated(
        itemCount: algorithms.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text("Step 1 - Corners:");
          } else if (index > 0 && index < 3) {
            return AlgorithmCard(algorithm: algorithms[index - 1]);
          } else if (index == 3) {
            return const Text("Step 2 - Edges:");
          } else {
            return AlgorithmCard(algorithm: algorithms[index - 2]);
          }
        },
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
      hasError: algorithms.isEmpty,
    );
  }
}
