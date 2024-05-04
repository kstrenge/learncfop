import 'package:flutter/material.dart';

class MoveIcon extends StatelessWidget {
  final List iconConfiguration;
  MoveIcon(this.iconConfiguration);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = List.generate(22, (_) => Colors.grey);

    for (int index in iconConfiguration) {
      colors[index] = Colors.yellow;
    }

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.transparent)),
                  Expanded(flex: 3, child: Container(color: colors[1])),
                  Expanded(flex: 3, child: Container(color: colors[2])),
                  Expanded(flex: 3, child: Container(color: colors[3])),
                  Expanded(flex: 1, child: Container(color: Colors.transparent)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: colors[4])),
                  Expanded(flex: 3, child: Container(color: colors[5])),
                  Expanded(flex: 3, child: Container(color: colors[6])),
                  Expanded(flex: 3, child: Container(color: colors[7])),
                  Expanded(flex: 1, child: Container(color: colors[8])),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: colors[9])),
                  Expanded(flex: 3, child: Container(color: colors[10])),
                  Expanded(flex: 3, child: Container(color: colors[11])),
                  Expanded(flex: 3, child: Container(color: colors[12])),
                  Expanded(flex: 1, child: Container(color: colors[13])),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: colors[14])),
                  Expanded(flex: 3, child: Container(color: colors[15])),
                  Expanded(flex: 3, child: Container(color: colors[16])),
                  Expanded(flex: 3, child: Container(color: colors[17])),
                  Expanded(flex: 1, child: Container(color: colors[18])),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.transparent)),
                  Expanded(flex: 3, child: Container(color: colors[19])),
                  Expanded(flex: 3, child: Container(color: colors[20])),
                  Expanded(flex: 3, child: Container(color: colors[21])),
                  Expanded(flex: 1, child: Container(color: Colors.transparent)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
