class PLLAlgorithm {
  final String title;
  final List<String> caseConfiguration;
  final List<List<Map<int, bool>>> arrows;
  final String algorithm;
  final String? notes;

  PLLAlgorithm({
    required this.title,
    required this.caseConfiguration,
    required this.arrows,
    required this.algorithm,
    this.notes,
  });

  factory PLLAlgorithm.fromJson(Map<String, dynamic> json) {
    return PLLAlgorithm(
      title: json["title"],
      caseConfiguration: json["caseConfiguration"].cast<String>(),
      arrows: json["arrows"].cast<List<Map<int, bool>>>(),
      algorithm: json["algorithm"],
      notes: json["notes"],
    );
  }
}
