class IndiceBolsa {
  final String name;
  final String code;
  final String location;
  final double points;
  final double variation;

  IndiceBolsa({
    required this.name,
    required this.code,
    required this.location,
    required this.points,
    required this.variation,
  });

  factory IndiceBolsa.fromJson(Map<String, dynamic> json, String sigla) {
    return IndiceBolsa(
      name: json['name'] as String,
      code: sigla,
      location: json['location'] as String,
      points: (json['points'] as num).toDouble(),
      variation: (json['variation'] as num).toDouble(),
    );
  }
}