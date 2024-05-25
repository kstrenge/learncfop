import 'package:flutter/material.dart';
import 'package:rubik/data/algorithm.dart';
import 'package:rubik/ui/widgets/oll_case_icon_widget.dart';

class AlgorithmCardOld extends StatelessWidget {
  final Algorithm algorithm;
  const AlgorithmCardOld(this.algorithm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          leading: CaseIcon(algorithm.caseConfiguration),
          title: Text(algorithm.title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(algorithm.algorithm),
              algorithm.notes != null ? Text(algorithm.notes!) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class AlgorithmCard extends StatelessWidget {
  final Algorithm algorithm;
  const AlgorithmCard(this.algorithm, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              child: CaseIcon(algorithm.caseConfiguration),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(algorithm.title),
                Text(algorithm.algorithm),
                algorithm.notes != null
                    ? Text(
                      algorithm.notes!,
                      style: const TextStyle(),
                      softWrap: true,
                    )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
