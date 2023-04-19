import 'package:flutter/material.dart';
import 'package:paradice/dice.dart';
import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_pool_6.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Créez un objet DicePool6
  final DicePool6 _dicePool6 = DicePool6()..ajouterDe6();


  // Définissez les variables
  int _nbrdice = 1;
  int nombreDe1 = 0;
  int nombreDe2 = 0;
  int nombreDe3 = 0;
  int nombreDe4 = 0;
  int nombreDe5 = 0;
  int nombreDe6 = 0;
  double moyenne = 0.0;

  // Méthodes pour ajouter/enlever des dés
  void _plus1() {
    setState(() {
      _dicePool6.ajouterDe6();
      _nbrdice = _dicePool6.getPoolSize();
    });
  }

  void _plus10() {
    setState(() {
      for (int i = 1; i < 10; i++) {
        _dicePool6.ajouterDe6();
      }
      _nbrdice = _dicePool6.getPoolSize();
    });
  }

  void _min1() {
    setState(() {
      if (_nbrdice > 1) {
        _dicePool6.retirerDe6();
        _nbrdice = _dicePool6.getPoolSize();
      }
    });
  }

  void _min10() {
    setState(() {
      for (int i = 1; i < 10 && _nbrdice > 1; i++) {
        _dicePool6.retirerDe6();
        _nbrdice = _dicePool6.getPoolSize();
      }
    });
  }

  // Réinitialisez les variables
  void _reset() {
    setState(() {
      _dicePool6.reset();
      _nbrdice = 1;
      _dicePool6.ajouterDe6();
    });
  }

  // Lancez les dés
  void _launchDice() {
    setState(() {
      _dicePool6.lancerDes(); // Mettre à jour les résultats des dés dans chaque objet Dice
    });
    _resDice(); // Mettre à jour les statistiques à partir des résultats mis à jour
  }

  // Mettez à jour les statistiques
  void _resDice() {
    setState(() {
      List<int> results6 = _dicePool6.getResults();

      // Calculez les statistiques:
      int total = results6.fold(0, (sum, item) => sum + item);
      moyenne = total / results6.length;

      // Mettez à jour le nombre de chaque résultats
      nombreDe1 = results6.where((item) => item == 1).length;
      nombreDe2 = results6.where((item) => item == 2).length;
      nombreDe3 = results6.where((item) => item == 3).length;

      nombreDe4 = results6.where((item) => item == 4).length;
      nombreDe5 = results6.where((item) => item == 5).length;
      nombreDe6 = results6.where((item) => item == 6).length;
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Creation de la ligne de boutons en faisant des colonnes
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: _min10, child: const Text('-10')),
              ElevatedButton(onPressed: _min1, child: const Text('-1')),
              ElevatedButton(
                  onPressed: _reset,
                  child: const Text(
                    'Reset',
                  )),
              ElevatedButton(onPressed: _plus1, child: const Text('+1')),
              ElevatedButton(onPressed: _plus10, child: const Text('+10')),
            ],
          ),
          //Creation de la ligne qui permet d'afficher le nombre de lances
          Row(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 100, left: 10)),
              const Text(
                'Nombre de D6: ',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '$_nbrdice',
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),

          Row(
            children: const <Widget>[
              Padding(padding: EdgeInsets.only(top: 50, left: 5)),
              Text(
                'Les resultats :',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
            Column(
              children: <Widget>[
                Text('Nombre de 1: ${nombreDe1}'),
                Text('Nombre de 2: ${nombreDe2}'),
                Text('Nombre de 3: ${nombreDe3}'),
              ],
            ),
            Column(
              children: <Widget>[
                Text('Nombre de 4: ${nombreDe4}'),
                Text('Nombre de 5: ${nombreDe5}'),
                Text('Nombre de 6: ${nombreDe6}'),
              ],
            ),
          ]),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                Text(
                  'Moyenne obtenue: ${moyenne.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchDice,
        tooltip: 'J\'ai de la chance !',
        child: const Icon(Icons.casino),
      ),
    );
  }
}
