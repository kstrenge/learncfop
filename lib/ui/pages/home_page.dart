import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../data/algorithm_provider.dart';
import 'info_page.dart';
import '../../ui/widgets/algorithm_card.dart';
import '../../ui/widgets/username.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? favourites = context
        .watch<AlgorithmProvider>()
        .getFavouriteAlgorithms();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text("Welcome, "), Username()],
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                ),
                icon: const Icon(Icons.info_outlined),
              ),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Theme()),
                ),
                icon: const Icon(Icons.info_outlined),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            sliver: favourites != null && favourites.isNotEmpty
                ? SliverList.separated(
                    itemCount: favourites.length,
                    itemBuilder: (context, index) =>
                        AlgorithmCard(algorithm: favourites[index]),
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
