import 'package:flutter/material.dart';
import 'package:learncfop/data/algorithm_provider.dart';
import 'package:provider/provider.dart';

import '../../data/algorithm.dart';
import '../../ui/pages/info.dart';
import '../../ui/widgets/algorithm_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Algorithm>? favourites =
        context.watch<AlgorithmProvider>().getFavouriteAlgorithms();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text("Welcome"),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Info()),
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
                : SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 32),
                        Text(
                            "Add your favourite algorithms\n to the Home page by clicking"),
                        SizedBox(height: 4),
                        Icon(Icons.star, color: Colors.amber)
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
