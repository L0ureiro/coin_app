import 'package:coin_app/model/moeda.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RepositorioMoedas {
  Future<List<Moeda>> carregarMoedas() async {
    final response = await http.get(Uri.parse('http://api.hgbrasil.com/finance?fields=only_results,currencies&key=AAAAAA'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = json.decode(response.body);
      final Map<String, dynamic> moedasJson = result['currencies'];
      List<Moeda> moedasOut = [];

      moedasJson.forEach((key, value) {
        if (key != "source") {
          if (value is Map<String, dynamic>) {
            final moeda = Moeda.fromJson(value, key);
            moedasOut.add(moeda);
          }
        }
      });

      return moedasOut;
    } else {
      throw Exception('Erro ao carregar dados da API');
    }
  }
}
