class Algorithm {
  final String title;
  final List<int> caseConfiguration;
  final String algorithm;
  final String? notes;

  Algorithm({
    required this.title,
    required this.caseConfiguration,
    required this.algorithm,
    this.notes,
  });

  factory Algorithm.fromJson(Map<String, dynamic> json) {
    return Algorithm(
        title: json["title"],
        caseConfiguration: json["caseConfiguration"].cast<int>(),
        algorithm: json["algorithm"],
        notes: json["notes"]);
  }
}
