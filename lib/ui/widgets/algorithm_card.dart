import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import 'oll_case_icon.dart';
import 'pll_case_icon.dart';

class AlgorithmCard extends StatelessWidget {
  final dynamic algorithm;
  final bool isOLL;
  const AlgorithmCard.oll(OLLAlgorithm this.algorithm,
      {this.isOLL = true, super.key});
  const AlgorithmCard.pll(PLLAlgorithm this.algorithm,
      {this.isOLL = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: isOLL
                  ? OLLCaseIcon(caseConfiguration: algorithm.caseConfiguration)
                  : PLLCaseIcon(
                      caseConfiguration: algorithm.caseConfiguration,
                      arrows: algorithm.arrows,
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
                          algorithm.title,
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
          ],
        ),
      ),
    );
  }
}
