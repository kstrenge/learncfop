import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_store.dart';

class AlgorithmOptionsButton extends StatefulWidget {
  final Algorithm algorithm;

  const AlgorithmOptionsButton({super.key, required this.algorithm});

  @override
  State<AlgorithmOptionsButton> createState() => _AlgorithmOptionsButtonState();
}

class _AlgorithmOptionsButtonState extends State<AlgorithmOptionsButton> {
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
              leading: widget.algorithm.isFavourite
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
            algorithmStore.storeAlgorithm(widget.algorithm);
          });
        }
        if (value == "edit") {}
      },
    );
  }
}
