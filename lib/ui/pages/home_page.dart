import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_provider.dart';
import '../../ui/pages/info_page.dart';
import '../../ui/pages/theme_page.dart';
import '../../ui/widgets/algorithm_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? pinned = context
        .watch<AlgorithmProvider>()
        .getPinnedAlgorithms();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text("Welcome"),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemePage()),
                ),
                icon: const Icon(Icons.color_lens_outlined),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                ),
                icon: const Icon(Icons.info_outlined),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            sliver: pinned != null && pinned.isNotEmpty
                ? SliverList.separated(
                    itemCount: pinned.length,
                    itemBuilder: (context, index) =>
                        AlgorithmCard(algorithm: pinned[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  )
                : SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 32),
                          Text(
                            "Pin the algorithms you always forget to the Home page by clicking",
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Icon(
                            Icons.push_pin_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(height: 64),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
