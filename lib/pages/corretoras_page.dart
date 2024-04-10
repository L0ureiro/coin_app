import 'package:flutter/material.dart';
import 'package:coin_app/model/indices.dart';
import 'package:coin_app/repository/indices_repository.dart';

class CorretorasPage extends StatefulWidget {
  const CorretorasPage({Key? key}) : super(key: key);

  @override
  _CorretorasPageState createState() => _CorretorasPageState();
}

class _CorretorasPageState extends State<CorretorasPage> {
  late Future<List<IndiceBolsa>> futureStockIndices;

  @override
  void initState() {
    super.initState();
    futureStockIndices = RepositorioIndices().fetchIndices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Índices das Bolsas'),
      ),
      body: FutureBuilder<List<IndiceBolsa>>(
        future: futureStockIndices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1, // Ajuste conforme necessário
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                IndiceBolsa stockIndex = snapshot.data![index];
                return Card(        
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(stockIndex.code, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(stockIndex.name, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        Text(stockIndex.location, textAlign: TextAlign.center),
                        Text('Pontos: ${stockIndex.points}'),
                        Text('Variação: ${stockIndex.variation.toStringAsFixed(2)}%'),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Sem dados'));
          }
        },
      ),
    );
  }
}
