import 'algorithm.dart';
import 'algorithm_provider.dart';

import 'package:hive/hive.dart';

class HiveAlgorithmProvider implements AlgorithmProvider {
  late final Box _algorithms;

  @override
  void startup() {
    _algorithms = Hive.box("algorithms");
    Hive.registerAdapter("OLLAlgorithm", OLLAlgorithm.fromJson);
  }

  @override
  Algorithm? loadAlgorithm(String id) => _algorithms.get(id);

  @override
  List<Algorithm> loadAlgorithms(String idContains) {
    return _algorithms.values
        .where((algorithm) => algorithm.id.contains(idContains))
        .toList()
        .forEach((algorithm) => Algorithm.fromJson(algorithm));
  }

  @override
  void storeAlgorithm(Algorithm algorithm) {}
}

// TODO: hier weitermachen. Hive Adapter implementieren, Methoden implementieren...
// ALGORITHM.DART NICHT MEHR ANFASSEN !!!!!!
