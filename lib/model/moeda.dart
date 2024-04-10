class Moeda {
  final String nome;
  final String code;
  final double buy;

  Moeda({
    required this.nome,
    required this.code,
    required this.buy,
  });

  factory Moeda.fromJson(Map<String, dynamic> json, String sigla) {
    return Moeda(
      nome: json['name'] as String,
      code: sigla,
      buy: json['buy'].toDouble(),
    );
  }
}
