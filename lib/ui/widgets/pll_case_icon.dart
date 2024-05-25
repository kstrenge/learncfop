import 'package:flutter/material.dart';

class PLLCaseIcon extends StatelessWidget {
  final List<String> caseConfiguration;
  final List<List<Map<int, bool>>> arrows;

  const PLLCaseIcon({
    required this.caseConfiguration,
    required this.arrows,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // draw side pieces in their colors:
    List<Color> sideColors = [];
    for (String color in caseConfiguration) {
      switch (color) {
        case ("g"):
          sideColors.add(Colors.green);
        case ("r"):
          sideColors.add(Colors.red);
        case ("b"):
          sideColors.add(Colors.blue);
        case ("o"):
          sideColors.add(Colors.orange);
        default:
          throw Error();
      }
    }

    //TODO: draw arrows!

    // breite mittelstein: 9
    // breite randstein: 3
    // insgesamte breite: 39
    // breite ohne rand: 31

    return SizedBox(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                  Expanded(flex: 31, child: Container(color: Colors.black)),
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[0])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[1])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[2])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.black)),
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[11])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[3])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.black)),
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[10])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[4])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.black)),
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[9])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: Colors.yellow)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 3, child: Container(color: sideColors[5])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                ],
              ),
            ),
            Expanded(child: Container(color: Colors.black)),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[8])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[7])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 9, child: Container(color: sideColors[6])),
                  Expanded(flex: 1, child: Container(color: Colors.black)),
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                  Expanded(flex: 31, child: Container(color: Colors.black)),
                  Expanded(flex: 4, child: Container(color: Colors.transparent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
