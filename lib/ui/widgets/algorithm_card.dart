import 'package:flutter/material.dart';
import 'package:rubik/ui/widgets/pll_case_icon.dart';

import '../../data/algorithm.dart';
import 'oll_case_icon.dart';

class AlgorithmCard extends StatelessWidget {
  final dynamic algorithm;
  final bool isOLL;
  const AlgorithmCard.oll(OLLAlgorithm this.algorithm, {this.isOLL = true, super.key});
  const AlgorithmCard.pll(PLLAlgorithm this.algorithm, {this.isOLL = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  Text(
                    algorithm.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold, // TODO: noch bolder
                    ),
                  ),
                  Text(
                    algorithm.algorithm,
                    style: const TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  algorithm.notes != null
                      ? Text(
                          algorithm.notes!,
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
