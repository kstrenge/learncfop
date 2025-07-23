import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import 'algorithm_options_button.dart';
import 'oll_case_icon.dart';
import 'pll_case_icon.dart';

class AlgorithmCard extends StatelessWidget {
  final Algorithm algorithm;

  const AlgorithmCard({super.key, required this.algorithm});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 4, 16),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: algorithm is OLLAlgorithm
                  ? OLLCaseIcon(
                      caseConfiguration:
                          (algorithm as OLLAlgorithm).caseConfiguration,
                    )
                  : PLLCaseIcon(
                      caseConfiguration:
                          (algorithm as PLLAlgorithm).caseConfiguration,
                      arrows: (algorithm as PLLAlgorithm).arrows,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          algorithm.label,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    algorithm.algorithm,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                  ),
                  algorithm.notes != null
                      ? Text(
                          algorithm.notes!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            AlgorithmOptionsButton(algorithm: algorithm),
          ],
        ),
      ),
    );
  }
}
