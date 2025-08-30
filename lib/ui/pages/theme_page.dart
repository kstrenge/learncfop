import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose your Theme")),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        itemCount: seedColors.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          final isActive =
              context.watch<SeedColorProvider>().seedColor == seedColors[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(isActive ? 16 : 128),
            child: Material(
              color: seedColors[index],
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                splashColor: rippleColorFromBackground(seedColors[index]),
                onTap: () => context.read<SeedColorProvider>().setSeedColor(
                  seedColors[index],
                ),
                child: isActive ? Icon(Icons.check) : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
