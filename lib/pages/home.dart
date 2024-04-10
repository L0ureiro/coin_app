import 'package:coin_app/pages/bitcoin_pages.dart';
import 'package:coin_app/pages/corretoras_page.dart';
import 'package:coin_app/pages/moedas_page.dart';
import 'package:coin_app/pages/taxas_pages.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _pageWidgets = [
    const MoedasPage(),
    const CorretorasPage(),
    const BitcoinPage(),
    const TaxasPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pageWidgets,
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          height: 65,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.attach_money), 
              label: 'Moedas'),
            NavigationDestination(
                icon: Icon(Icons.show_chart_sharp),
                 label: 'Charts'),
            NavigationDestination(
                icon: Icon(Icons.currency_bitcoin),
                 label: 'Bitcoin'),
            NavigationDestination(
                icon: Icon(Icons.price_change_outlined),
                 label: 'Taxas'),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
    );
  }
}
