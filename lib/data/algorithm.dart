abstract class Algorithm {
  /// ID of the Algorithm.
  /// Rules: must start with "oll", "pll", "oll2llok", "pll2look".
  /// Examples: "oll_0", "pll_15", "oll2look_3".
  final String _id;

  String label;
  String algorithm;
  String? notes;
  bool _isFavourite;

  Algorithm({
    required String id,
    required this.label,
    required this.algorithm,
    this.notes,
    required bool isFavourite,
  })  : _id = id,
        _isFavourite = isFavourite;

  get id => _id;
  get isFavourite => _isFavourite;
  void toggleFavourite() => _isFavourite = !_isFavourite;

  Algorithm fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() => {
        "id": _id,
        "label": label,
        "algorithm": algorithm,
        "notes": notes,
        "isFavourite": _isFavourite,
      };
}

class OLLAlgorithm extends Algorithm {
  final List<int> _caseConfiguration;

  OLLAlgorithm({
    required super.id,
    required super.label,
    required super.algorithm,
    super.notes,
    required super.isFavourite,
    required List<int> caseConfiguration,
  }) : _caseConfiguration = caseConfiguration;

  @override
  Algorithm fromJson(Map<String, dynamic> json) => OLLAlgorithm(
        id: json["id"] as String,
        label: json["label"] as String,
        algorithm: json["algorithm"] as String,
        notes: json["notes"] as String?,
        isFavourite: json["isFavourite"] as bool,
        caseConfiguration: json["caseConfiguration"] as List<int>,
      );

  get caseConfiguration => _caseConfiguration;

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": _caseConfiguration,
      };
}

class PLLAlgorithm extends Algorithm {
  final List<String> _caseConfiguration;
  final List<List<dynamic>> _arrows;

  PLLAlgorithm({
    required super.id,
    required super.label,
    required super.algorithm,
    super.notes,
    required super.isFavourite,
    required List<String> caseConfiguration,
    required List<List<dynamic>> arrows,
  })  : _caseConfiguration = caseConfiguration,
        _arrows = arrows;

  @override
  Algorithm fromJson(Map<String, dynamic> json) => PLLAlgorithm(
        id: json["id"] as String,
        label: json["label"] as String,
        algorithm: json["algorithm"] as String,
        notes: json["notes"] as String?,
        isFavourite: json["isFavourite"] as bool,
        caseConfiguration: json["caseConfiguration"] as List<String>,
        arrows: json["arrows"] as List<List<dynamic>>,
      );

  get caseConfiguration => _caseConfiguration;
  get arrows => _arrows;

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": _caseConfiguration,
        "arrows": _arrows,
      };
}
