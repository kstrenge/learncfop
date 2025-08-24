import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_provider.dart';
import '../widgets/algorithm_page.dart';
import '../widgets/algorithm_card.dart';
import '../widgets/error.dart';

class PLLPage extends StatelessWidget {
  const PLLPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? algorithms = context
        .watch<AlgorithmProvider>()
        .getAlgorithmsWhereIdContains("pll");

    return AlgorithmPage(
      title: "Instant Permutation of Last Layer",
      algorithmSliverList: algorithms != null && algorithms.isNotEmpty
          ? SliverList.separated(
              itemCount: algorithms.length,
              itemBuilder: (context, index) =>
                  AlgorithmCard(algorithm: algorithms[index]),
              separatorBuilder: (context, index) => SizedBox(height: 16),
            )
          : SliverList(delegate: SliverChildListDelegate([ErrorMessage()])),
    );
  }
}
