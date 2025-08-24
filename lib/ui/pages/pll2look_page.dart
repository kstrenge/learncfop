import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_provider.dart';
import '../widgets/algorithm_page.dart';
import '../widgets/algorithm_card.dart';
import '../widgets/error.dart';

class PLL2LookPage extends StatelessWidget {
  const PLL2LookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? algorithms = context
        .watch<AlgorithmProvider>()
        .getAlgorithmsWhereIdContains("pll2look");

    return AlgorithmPage(
      title: "Permutation of Last Layer in 2 steps",
      algorithmSliverList: algorithms != null && algorithms.isNotEmpty
          ? SliverList.separated(
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
            )
          : SliverList(delegate: SliverChildListDelegate([ErrorMessage()])),
    );
  }
}
