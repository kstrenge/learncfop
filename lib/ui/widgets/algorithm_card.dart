import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
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
                          (algorithm as OLLAlgorithm).getCaseConfiguration(),
                    )
                  : PLLCaseIcon(
                      caseConfiguration:
                          (algorithm as PLLAlgorithm).getCaseConfiguration(),
                      arrows: (algorithm as PLLAlgorithm).getArrows(),
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
                          algorithm.getLabel(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    algorithm.getAlgorithm(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(),
                  ),
                  algorithm.getNotes() != null
                      ? Text(
                          algorithm.getNotes()!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            OptionsButton(algorithm: algorithm),
          ],
        ),
      ),
    );
  }
}

class OptionsButton extends StatefulWidget {
  final Algorithm algorithm;

  const OptionsButton({super.key, required this.algorithm});

  @override
  State<OptionsButton> createState() => _OptionsButtonState();
}

class _OptionsButtonState extends State<OptionsButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      menuPadding: EdgeInsets.zero,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: "favourite",
            child: ListTile(
              title: Text("Favourite"),
              leading: widget.algorithm.getIsFavourite()
                  ? Icon(
                      Icons.star,
                      color: Colors.amber,
                    )
                  : Icon(Icons.star_outline),
            ),
          ),
          PopupMenuItem(
            value: "edit",
            child: ListTile(
              title: Text("Edit"),
              leading: Icon(Icons.edit_outlined),
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == "favourite") {
          setState(() {
            widget.algorithm.toggleFavourite();
          });
        }
        if (value == "edit") {}
      },
    );
  }
}
