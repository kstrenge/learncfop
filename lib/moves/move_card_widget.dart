import 'package:flutter/material.dart';
import 'package:rubik/moves/moves.dart';
import 'package:rubik/moves/oll_move_icon_widget.dart';

class MoveCard extends StatelessWidget {
  final Move move;
  MoveCard(this.move);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListTile(
          leading: MoveIcon(move.iconConfiguration),
          title: Text(move.solveString),
        ),
      ),
    );
  }
}
