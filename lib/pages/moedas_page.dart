import 'package:coin_app/model/moeda.dart';
import 'package:coin_app/repository/moeda_repository.dart';
import 'package:flutter/material.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  late Future<List<Moeda>> futureMoedas;

  @override
  void initState() {
    super.initState();
    futureMoedas = RepositorioMoedas().carregarMoedas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotações de Moedas'),
      ),
      body: FutureBuilder<List<Moeda>>(
        future: futureMoedas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Moeda currency = snapshot.data![index];
                return ListTile(
                  titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
                  title: Text(currency.nome),
                  subtitle: Text(currency.code),
                  trailing: Text('Valor: R\$${currency.buy.toStringAsFixed(2)}', style: TextStyle(fontSize: 18),),
                );
              },
            );
          } else {
            return const Center(child: Text('Sem dados'));
          }
        },
      ),
    );
  }
}

