class PLLAlgorithm {
  final String title;
  final dynamic caseConfiguration;
  final String algorithm;
  final String? notes;

  PLLAlgorithm({
    required this.title,
    required this.caseConfiguration,
    required this.algorithm,
    this.notes,
  });

  factory PLLAlgorithm.fromJson(Map<String, dynamic> json) {
    return PLLAlgorithm(
      title: json["title"],
      caseConfiguration: json["caseConfiguration"].cast<int>(),
      algorithm: json["algorithm"],
      notes: json["notes"],
    );
  }
}
