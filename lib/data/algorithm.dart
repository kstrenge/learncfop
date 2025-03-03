abstract class Algorithm {
  final String _id;
  String _label;
  String _algorithm;
  String? _notes;
  bool _isFavourite;

  Algorithm.fromMap(Map<String, dynamic> map)
      : _id = map["id"],
        _label = map["label"],
        _algorithm = map["algorithm"],
        _notes = map["notes"],
        _isFavourite = map["isFavourite"] == 1;

  String getId() => _id;
  String getLabel() => _label;
  String getAlgorithm() => _algorithm;
  String? getNotes() => _notes;
  bool getIsFavourite() => _isFavourite;

  void setLabel(String newLabel) => _label = newLabel;
  void setAlgorithm(String newAlgorithm) => _algorithm = newAlgorithm;
  void setNotes(String? newNotes) => _notes = newNotes;

  void toggleFavourite() => _isFavourite = !_isFavourite;

  Map<String, dynamic> toMap() => {
        "id": _id,
        "label": _label,
        "algorithm": _algorithm,
        "notes": _notes,
        "isFavourite": _isFavourite ? 1 : 0,
      };
}

class OLLAlgorithm extends Algorithm {
  final List<int> _caseConfiguration;

  OLLAlgorithm.fromMap(Map<String, dynamic> map)
      : _caseConfiguration = List<int>.from(map["caseConfiguration"]),
        super.fromMap(map);

  List<int> getCaseConfiguration() => _caseConfiguration;

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "caseConfiguration": _caseConfiguration.toString(),
      };
}

class PLLAlgorithm extends Algorithm {
  final List<String> _caseConfiguration;
  final List<List<dynamic>> _arrows;

  PLLAlgorithm.fromMap(Map<String, dynamic> map)
      : _caseConfiguration = List<String>.from(map["caseConfiguration"]),
        _arrows = List<List<dynamic>>.from(map["arrows"]),
        super.fromMap(map);

  getCaseConfiguration() => _caseConfiguration;
  getArrows() => _arrows;

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        "caseConfiguration": _caseConfiguration.toString(),
        "arrows": _arrows.toString(),
      };
}
