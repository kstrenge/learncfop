import 'package:flutter/material.dart';

class AlgorithmPage extends StatelessWidget {
  final String title;
  final SliverList algorithmSliverList;
  final bool hasError;

  const AlgorithmPage(
      {super.key,
      required this.title,
      required this.algorithmSliverList,
      required this.hasError});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !hasError
          ? CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: Text(title),
                ),
                SliverPadding(
                  padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
                  sliver: algorithmSliverList,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Error while loading algorithms.\nReset algorithms in settings.",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
