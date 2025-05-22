import 'dart:convert';

abstract class Algorithm {
  final String _id;
  String label;
  String algorithm;
  String? notes;
  bool _isFavourite;

  Algorithm.fromMap(Map<String, dynamic> map)
      : _id = map["id"],
        label = map["label"],
        algorithm = map["algorithm"],
        notes = map["notes"],
        _isFavourite = map["isFavourite"] == 1;

  get id => _id;
  get isFavourite => _isFavourite;
  void toggleFavourite() => _isFavourite = !_isFavourite;

  Map<String, dynamic> toMap() => {
        "id": _id,
        "label": label,
        "algorithm": algorithm,
        "notes": notes,
        "isFavourite": _isFavourite ? 1 : 0,
      };
}

class OLLAlgorithm extends Algorithm {
  final List<int> _caseConfiguration;

  OLLAlgorithm.fromMap(Map<String, dynamic> map)
      : _caseConfiguration = List<int>.from(map["caseConfiguration"]),
        // TODO: vielleicht Listen in den JSON Dateien als String machen, sodass es gleich ist zu einer Abfrage aus der Datenbank!
        // NEIN FUNKTIONIERT NICHT!!!!
        // TODO: loadAlgorithm so umschreiben, dass TEXT als JSON interpretiert wird
        super.fromMap(map);

  get caseConfiguration => _caseConfiguration;

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "caseConfiguration": jsonEncode(_caseConfiguration),
      };
}

class PLLAlgorithm extends Algorithm {
  final List<String> _caseConfiguration;
  final List<List<dynamic>> _arrows;

  PLLAlgorithm.fromMap(Map<String, dynamic> map)
      : _caseConfiguration = List<String>.from(map["caseConfiguration"]),
        _arrows = List<List<dynamic>>.from(map["arrows"]),
        super.fromMap(map);

  get caseConfiguration => _caseConfiguration;
  get arrows => _arrows;

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "caseConfiguration": jsonEncode(_caseConfiguration),
        "arrows": jsonEncode(_arrows),
      };
}
