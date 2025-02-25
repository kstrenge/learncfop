abstract class Algorithm {
  String id;
  String label;
  String algorithm;
  String? notes;
  bool isFavourite;

  Algorithm.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        label = json["label"],
        algorithm = json["algorithm"],
        notes = json["notes"],
        isFavourite = json["isFavourite"] ?? false;

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "algorithm": algorithm,
        "notes": notes,
        "isFavourite": isFavourite,
      };
}

class OLLAlgorithm extends Algorithm {
  final List<int> caseConfiguration;

  OLLAlgorithm.fromJson(Map<String, dynamic> json)
      : caseConfiguration = json["caseConfiguration"].cast<int>(),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": caseConfiguration,
      };
}

class PLLAlgorithm extends Algorithm {
  final List<String> caseConfiguration;
  final List<List<dynamic>> arrows;

  PLLAlgorithm.fromJson(Map<String, dynamic> json)
      : caseConfiguration = json["caseConfiguration"].cast<String>(),
        arrows = json["arrows"].cast<List<dynamic>>(),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        "caseConfiguration": caseConfiguration,
        "arrows": arrows,
      };
}
