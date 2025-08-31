import '../../data/model/algorithm.dart';

/// Interface for services that save algorithms persistently, e.g. in a database.
abstract class AlgorithmRepository {
  /// Starts the AlgorithmRepository service.
  /// Is called at the startup of flutter app.
  Future<void> startup();

  /// Loads all stored algorithms as a Map`<int, Algorithm>` with the ids as keys.
  Future<Map<String, Algorithm>> loadAllAlgorithms();

  /// Store an algorithm.
  Future<void> storeAlgorithm(Algorithm algorithm);
}
