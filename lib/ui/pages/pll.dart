import 'package:flutter/material.dart';

import '../../data/local_store_old.dart';
import '../widgets/algorithm_card.dart';

class PLL extends StatelessWidget {
  const PLL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadAlgorithmsWhere("id LIKE 'pll-%'"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 64, bottom: 16),
                    child: Text(
                      "Instant Permutation of Last Layer",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                } else {
                  return AlgorithmCard(algorithm: snapshot.data![index - 1]);
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
