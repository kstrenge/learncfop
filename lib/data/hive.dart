import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'algorithm.dart';
import 'algorithm_provider.dart';

class HiveAlgorithmProvider implements AlgorithmProvider {
  late final Box _algorithms;
  bool _isReady = false;

  @override
  Future<void> startup() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _algorithms = await Hive.openBox("algorithms");
    _isReady = true;
  }

  @override
  bool isReady() => _isReady;

  @override
  Algorithm? loadAlgorithm(String id) {
    assert(isReady(), "Start Hive first with algorithmProvider.startup()");

    return _algorithms.get(id);
  }

  @override
  List<Algorithm> loadAlgorithms(String idContains) {
    assert(isReady(), "Start Hive first with algorithmProvider.startup()");

    return _algorithms.values
        .where((jsonAlgorithm) => jsonAlgorithm["id"].contains(idContains))
        .map((jsonAlgorithm) =>
            Algorithm.fromJson((jsonAlgorithm as Map).cast<String, dynamic>()))
        .toList();
  }

  @override
  List<Algorithm> loadFavouriteAlgorithms() {
    assert(isReady(), "Start Hive first with algorithmProvider.startup()");

    return _algorithms.values
        .where((jsonAlgorithm) => jsonAlgorithm["isFavourite"] == true)
        .map((jsonAlgorithm) => Algorithm.fromJson(jsonAlgorithm))
        .toList();
  }

  @override
  void storeAlgorithm(Algorithm algorithm) {
    assert(isReady(), "Start Hive first with algorithmProvider.startup()");

    _algorithms.put(algorithm.id, algorithm.toJson());
  }
}
