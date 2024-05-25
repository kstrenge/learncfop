import 'package:flutter/material.dart';
import 'package:rubik/ui/widgets/algorithm_card_widget.dart';
import 'package:rubik/data/algorithm.dart';

class PLL extends StatelessWidget {
  const PLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("PLL"))),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [SizedBox()],
        ),
      ),
    );
  }
}
