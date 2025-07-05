import 'package:flutter/material.dart';

import '../../data/algorithm.dart';
import 'info.dart';
import '../widgets/algorithm_card.dart';

class Home extends StatelessWidget {
  final List<Algorithm> favourites;
  const Home({super.key, required this.favourites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
      body: favourites.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text("Welcome",
                      style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 8),
                  Spacer(),
                  Center(
                    child: Column(
                      children: [
                        Text(
                            "Add your favourite algorithms\n to the Home page by clicking"),
                        Icon(Icons.star, color: Colors.amber)
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favourites.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 64, bottom: 16),
                    child: Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                } else {
                  return AlgorithmCard(algorithm: favourites[index - 1]);
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            ),
    );
  }
}
