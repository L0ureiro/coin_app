import 'package:coin_app/model/indices.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RepositorioIndices {
  Future<List<IndiceBolsa>> fetchIndices() async {
    final response = await http.get(Uri.parse('http://api.hgbrasil.com/finance?fields=only_results,stocks&key=b7c3167e'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> result = json.decode(response.body);
      final Map<String, dynamic> stocksJson = result['stocks'];
      List<IndiceBolsa> indices = [];

      stocksJson.forEach((key, value) {
        indices.add(IndiceBolsa.fromJson(value, key));
      });

      return indices;
    } else {
      throw Exception('Failed to load stock indices');
    }
  }
}