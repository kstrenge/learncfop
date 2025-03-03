import 'package:flutter/material.dart';

import '../../data/json_storage.dart';
import '../../data/algorithm.dart';
import '../widgets/algorithm_card.dart';
import '../../ui/pages/info.dart';

Future<List<OLLAlgorithm>> loadFavouriteAlgorithms() async {
  List<Map<String, dynamic>>? allAlgorithms =
      await jsonStore.getListLike("%-%"); // gets all algorithms
}

class OLL extends StatelessWidget {
  const OLL({super.key});

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
      body: FutureBuilder(
        future: loadFavouriteAlgorithms(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text("Welcome",
                        style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 8),
                    // Text("Always Forgetters:", style: Theme.of(context).textTheme.bodyLarge),
                    Spacer(),
                    Text(
                        "Add your favourite algorithms\n to the Home page by clicking"),
                    Spacer(),
                  ],
                ),
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data!.length + 1,
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
                    return AlgorithmCard(algorithm: snapshot.data![index - 1]);
                  }
                },
                separatorBuilder: (context, index) => SizedBox(height: 16),
              );
            }
          }
          if (snapshot.hasError) {
            return Text(
                "An error occured, please reset your algorithms in Settings.");
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
