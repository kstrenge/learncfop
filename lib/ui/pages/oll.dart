import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../widgets/algorithm_page.dart';
import '../widgets/algorithm_card.dart';

class OLL extends StatelessWidget {
  final List<Algorithm> algorithms;
  const OLL({super.key, required this.algorithms});

  @override
  Widget build(BuildContext context) {
    return AlgorithmPage(
      title: "Instant Orientation of Last Layer",
      algorithmSliverList: SliverList.separated(
        itemCount: algorithms.length,
        itemBuilder: (context, index) =>
            AlgorithmCard(algorithm: algorithms[index]),
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
      hasError: algorithms.isEmpty,
    );
  }
}
