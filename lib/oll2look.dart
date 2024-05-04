import 'package:flutter/material.dart';
import 'package:rubik/moves/move_card_widget.dart';
import 'package:rubik/moves/moves.dart';

class Oll2Look extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OLL 2Look")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            MoveCard(oll2look01),
            MoveCard(oll2look02),
            MoveCard(oll2look03),
          ],
        ),
      ),
    );
  }
}
