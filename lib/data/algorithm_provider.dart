import 'package:flutter/material.dart';

import 'algorithm.dart';
import 'algorithm_repository.dart';

/// Provides algorithms for state management. Updates UI when user makes changes.
class AlgorithmProvider extends ChangeNotifier {
  final AlgorithmRepository _repository;
  Map<String, Algorithm> _algorithms = <String, Algorithm>{};

  AlgorithmProvider(this._repository);

  /// Loads all algorithms into the Provider.
  Future<void> loadAlgorithms() async {
    _algorithms = await _repository.loadAllAlgorithms();
  }

  /// Gets an algorithm by id. Returns null if it doesn't exist.
  Algorithm? getAlgorithm(String id) {
    return _algorithms[id];
  }

  /// Gets all algorithms. Returns null if none exist.
  List<Algorithm>? getAllAlgorithms(String id) {
    if (_algorithms.isNotEmpty) {
      return _algorithms.values.toList();
    } else {
      return null;
    }
  }

  /// Gets all algorithms where id contains a specific String.
  /// Returns null if there are no matching algorithms.
  List<Algorithm>? getAlgorithmsWhereIdContains(String idContains) {
    final results = _algorithms.values
        .where((value) => value.id.contains(idContains))
        .toList();
    if (results.isNotEmpty) {
      return results;
    } else {
      return null;
    }
  }

  /// Returns all algorithms where isPinned == true.
  /// Returns null if there are none.
  List<Algorithm>? getPinnedAlgorithms() {
    final results = _algorithms.values
        .where((value) => value.isPinned)
        .toList();
    if (results.isNotEmpty) {
      return results;
    } else {
      return null;
    }
  }

  /// Toggles isPinned for an algorithm and updates UI accordingly.
  void togglePinned(Algorithm algorithm) {
    algorithm.togglePinned();
    _algorithms[algorithm.id] = algorithm;
    _repository.storeAlgorithm(algorithm);
    notifyListeners();
  }

  /// Saves changes of an updated algorithm.
  /// Notifies listeners to update UI.
  void updateAlgorithm(Algorithm updatedAlgorithm) {
    _algorithms[updatedAlgorithm.id] = updatedAlgorithm;
    _repository.storeAlgorithm(updatedAlgorithm);
    notifyListeners();
  }
}
