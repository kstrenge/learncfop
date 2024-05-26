abstract class Algorithm {
  final String title;
  final String algorithm;
  final String? notes;

  Algorithm({
    required this.title,
    required this.algorithm,
    this.notes,
  });
}

class OLLAlgorithm extends Algorithm {
  final List<int> caseConfiguration;

  OLLAlgorithm({
    required super.title,
    required super.algorithm,
    super.notes,
    required this.caseConfiguration,
  });

  factory OLLAlgorithm.fromJson(Map<String, dynamic> json) {
    return OLLAlgorithm(
      title: json["title"],
      caseConfiguration: json["caseConfiguration"].cast<int>(),
      algorithm: json["algorithm"],
      notes: json["notes"],
    );
  }
}

class PLLAlgorithm extends Algorithm {
  final List<String> caseConfiguration;
  final List arrows; // TODO: Warum nicht List<List>!?

  PLLAlgorithm({
    required super.title,
    required this.caseConfiguration,
    required this.arrows,
    required super.algorithm,
    super.notes,
  });

  factory PLLAlgorithm.fromJson(Map<String, dynamic> json) {
    return PLLAlgorithm(
      title: json["title"],
      caseConfiguration: json["caseConfiguration"].cast<String>(),
      arrows: json["arrows"].cast<List>(),
      algorithm: json["algorithm"],
      notes: json["notes"],
    );
  }
}
