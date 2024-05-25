import 'package:flutter/material.dart';
import 'package:rubik/data/pll_algorithm.dart';
import 'package:rubik/ui/widgets/pll_case_icon.dart';

class AlgorithmCard extends StatelessWidget {
  final PLLAlgorithm algorithm;
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
              // child: PLLCaseIcon(algorithm.caseConfiguration),
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

// class AlgorithmCardOld extends StatelessWidget {
//   final Algorithm algorithm;
//   const AlgorithmCardOld(this.algorithm, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         child: ListTile(
//           leading: OLLCaseIcon(algorithm.caseConfiguration),
//           title: Text(algorithm.title),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(algorithm.algorithm),
//               algorithm.notes != null ? Text(algorithm.notes!) : const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }