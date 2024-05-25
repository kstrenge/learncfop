import 'package:flutter/material.dart';
import 'package:rubik/ui/widgets/pll_case_icon.dart';

class PLL extends StatelessWidget {
  const PLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("PLL"))),
      body: Center(
        child: SizedBox(
          height: 200,
          child: PLLCaseIcon([1, 1, 1, 1]),
        ),
      ),
    );
  }
}
