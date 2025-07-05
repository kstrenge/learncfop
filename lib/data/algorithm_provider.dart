import 'algorithm.dart';
import 'hive.dart';

AlgorithmProvider algorithmProvider = HiveAlgorithmProvider();

abstract class AlgorithmProvider {
  /// Starts the Provider service.
  /// Is called at the startup of flutter app.
  Future<void> startup();

  /// Checks if the Provider is ready.
  bool isReady();

  /// Load a stored algorithm via its id.
  /// Returns null if no algorithm with id exists.
  Algorithm? loadAlgorithm(String id);

  /// Load a bunch of algorithms with given substring in id.
  /// Returns empty list if no algorithms with substring in id exist.
  List<Algorithm> loadAlgorithms(String idContains);

  /// Load the favourite algorithms.
  /// Returns empty list if there are none.
  List<Algorithm> loadFavouriteAlgorithms();

  /// Store an algorithm.
  void storeAlgorithm(Algorithm algorithm);
}
