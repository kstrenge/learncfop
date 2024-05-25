class OLLAlgorithm {
  final String title;
  final List<int> caseConfiguration;
  final String algorithm;
  final String? notes;

  OLLAlgorithm({
    required this.title,
    required this.caseConfiguration,
    required this.algorithm,
    this.notes,
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
