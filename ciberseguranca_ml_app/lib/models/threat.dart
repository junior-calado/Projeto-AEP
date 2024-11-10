class Threat {
  final int id;
  final String title;
  final String description;
  final String severity;

  Threat({required this.id, required this.title, required this.description, required this.severity});

  factory Threat.fromJson(Map<String, dynamic> json) {
    return Threat(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      severity: json['severity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'severity': severity,
    };
  }
}
