import 'package:learncfop/data/algorithm.dart';

abstract class AlgorithmProvider {
  /// Starts the Provider service.
  /// Is called at the startup of flutter app.
  void startup();

  /// Load a stored algorithm via its id.
  /// Returns null if no algorithm with id exists.
  Algorithm? loadAlgorithm(String id);

  /// Load a bunch of algorithms with given substring in id.
  /// Returns null if no algorithms with substring in id exist.
  List<Algorithm>? loadAlgorithms(String idContains);

  /// Store an algorithm.
  void storeAlgorithm(Algorithm algorithm);
}
