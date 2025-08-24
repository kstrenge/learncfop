import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_provider.dart';
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
                          style: Theme.of(context).textTheme.labelSmall!
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
            IconButton(
              onPressed: () =>
                  context.read<AlgorithmProvider>().togglePinned(algorithm),
              icon: algorithm.isPinned
                  ? Icon(
                      Icons.push_pin,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Icon(Icons.push_pin_outlined),
            ),

            // PopupMenuButton(
            //   menuPadding: EdgeInsets.zero,
            //   itemBuilder: (context) {
            //     return [
            //       PopupMenuItem(
            //         value: "pin",
            //         child: ListTile(
            //           title: Text("Pin"),
            //           leading: algorithm.isPinned
            //               ? Icon(
            //                   Icons.star,
            //                   color: Colors.amber,
            //                 )
            //               : Icon(Icons.star_outline),
            //         ),
            //       ),
            //       PopupMenuItem(
            //         value: "edit",
            //         child: ListTile(
            //           title: Text("Edit"),
            //           leading: Icon(Icons.edit_outlined),
            //         ),
            //       ),
            //     ];
            //   },
            //   onSelected: (value) {
            //     if (value == "pin") {
            //       context.read<AlgorithmProvider>().togglePinned(algorithm);
            //     }
            //     if (value == "edit") {}
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
