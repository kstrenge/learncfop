abstract class Algorithm {
  final String _id;
  String _label;
  String _algorithm;
  String? _notes;
  bool _isFavourite;

  Algorithm.fromJson(Map<String, dynamic> json)
      : _id = json["id"],
        _label = json["label"],
        _algorithm = json["algorithm"],
        _notes = json["notes"],
        _isFavourite = json["isFavourite"] ?? false;

  String getId() => _id;
  String getLabel() => _label;
  String getAlgorithm() => _algorithm;
  String? getNotes() => _notes;
  bool getIsFavourite() => _isFavourite;

  void setLabel(String newLabel) => _label = newLabel;
  void setAlgorithm(String newAlgorithm) => _algorithm = newAlgorithm;
  void setNotes(String? newNotes) => _notes = newNotes;

  void toggleFavourite() => _isFavourite = !_isFavourite;

  Map<String, dynamic> toJson() => {
        "id": _id,
        "label": _label,
        "algorithm": _algorithm,
        "notes": _notes,
        "isFavourite": _isFavourite,
      };
}

class OLLAlgorithm extends Algorithm {
  final List<int> _caseConfiguration;

  OLLAlgorithm.fromJson(Map<String, dynamic> json)
      : _caseConfiguration = json["caseConfiguration"].cast<int>(),
        super.fromJson(json);

  List<int> getCaseConfiguration() => _caseConfiguration;

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": _caseConfiguration,
      };
}

class PLLAlgorithm extends Algorithm {
  final List<String> _caseConfiguration;
  final List<List<dynamic>> _arrows;

  PLLAlgorithm.fromJson(Map<String, dynamic> json)
      : _caseConfiguration = json["caseConfiguration"].cast<String>(),
        _arrows = json["arrows"].cast<List<dynamic>>(),
        super.fromJson(json);

  getCaseConfiguration() => _caseConfiguration;
  getArrows() => _arrows;

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": _caseConfiguration,
        "arrows": _arrows,
      };
}
