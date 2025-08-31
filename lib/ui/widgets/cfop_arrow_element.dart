import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widget_arrows/widget_arrows.dart';

/// Creates arrows for the OLL case icons:
class CFOPArrowElement extends StatelessWidget {
  final String id;
  final String? targetId;
  final bool doubleSided;
  final Widget child;

  const CFOPArrowElement({
    required this.id,
    required this.targetId,
    required this.doubleSided,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ArrowElement(
      id: id,
      targetId: targetId,
      bow: 0,
      stretch: 0,
      straights: true,
      color: Colors.black,
      width: 2.5,
      tipLength: 7,
      tipAngleOutwards: pi * 0.15,
      sourceAnchor: Alignment.center,
      targetAnchor: Alignment.center,
      doubleSided: doubleSided,
      child: child,
    );
  }
}
