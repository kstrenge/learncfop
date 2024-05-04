import 'package:flutter/material.dart';
import 'package:rubik/main.dart';
import 'package:rubik/oll2look.dart';

class Startseite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rubik")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text("OLL 2LOOK"),
              onPressed: () => navigateTo(Oll2Look(), context),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("OLL"),
              onPressed: () {},
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("PLL"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
