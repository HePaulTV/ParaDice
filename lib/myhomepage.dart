import 'package:flutter/material.dart';
import 'package:paradice/dice.dart';
import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_pool_6.dart';
import 'package:paradice/dice_pool_10.dart';
import 'package:paradice/dice_pool_20.dart';
import 'package:paradice/dice_pool_100.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Créez un objet DicePool6
  DicePool _dicePool = DicePool6()..ajouterDe6();


  // Définissez les variables
  int _nbrdice = 1;
  int nombreDe1 = 0;
  int nombreDe2 = 0;
  int nombreDe3 = 0;
  int nombreDe4 = 0;
  int nombreDe5 = 0;
  int nombreDe6 = 0;
  double moyenne = 0.0;

  String _diceType = 'D6';

  void _changeToD6() {
    setState(() {
      _dicePool = DicePool6()..ajouter();
      _nbrdice = 1;
      _diceType = 'D6';
    });
  }

  void _changeToD10() {
    setState(() {
      _dicePool = DicePool10()..ajouter();
      _nbrdice = 1;
      _diceType = 'D10';
    });
  }

  void _changeToD20() {
    setState(() {
      _dicePool = DicePool20()..ajouter();
      _nbrdice = 1;
      _diceType = 'D20';
    });
  }

  void _changeToD100() {
    setState(() {
      _dicePool = DicePool100()..ajouter();
      _nbrdice = 1;
      _diceType = 'D100';
    });
  }

// Méthodes pour ajouter/enlever des dés
void _plus1() {
  setState(() {
    _dicePool.ajouter();
    _nbrdice = _dicePool.getPoolSize();
  });
}

void _plus10() {
  setState(() {
    for (int i = 1; i < 10; i++) {
      _dicePool.ajouter();
    }
    _nbrdice = _dicePool.getPoolSize();
  });
}

void _min1() {
  setState(() {
    if (_nbrdice > 1) {
      _dicePool.retirer();
      _nbrdice = _dicePool.getPoolSize();
    }
  });
}

void _min10() {
  setState(() {
    for (int i = 1; i < 10 && _nbrdice > 1; i++) {
      _dicePool.retirer();
    }
    _nbrdice = _dicePool.getPoolSize();
  });
}

// Réinitialisez les variables
void _reset() {
  setState(() {
    _dicePool.reset();
    _nbrdice = 1;
    _dicePool.ajouter();
  });
}

// Lancez les dés
void _launchDice() {
  setState(() {
    _dicePool.lancerDes(); // Mettre à jour les résultats des dés dans chaque objet Dice
  });
  _resDice(); // Mettre à jour les statistiques à partir des résultats mis à jour
}

// Mettez à jour les statistiques
  void _resDice() {
    setState(() {
      List<int> results = _dicePool.getResults();

      // Calculez les statistiques:
      int total = results.fold(0, (sum, item) => sum + item);
      moyenne = total / results.length;

      // Mettez à jour le nombre de chaque résultats
      nombreDe1 = results.where((item) => item == 1).length;
      nombreDe2 = results.where((item) => item == 2).length;
      nombreDe3 = results.where((item) => item == 3).length;

      nombreDe4 = results.where((item) => item == 4).length;
      nombreDe5 = results.where((item) => item == 5).length;
      nombreDe6 = results.where((item) => item == 6).length;
    });
  }

  List<Widget> _getResultsWidgets() {
    List<Widget> resultsWidgets = [];
    int maxFaces = int.parse(_diceType.substring(1));

    for (int face = 1; face <= maxFaces; face++) {
      int count = _dicePool.getResults().where((item) => item == face).length;
      resultsWidgets.add(Text('Nombre de $face: $count', style: TextStyle(color: Colors.white)));
    }

    return resultsWidgets;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 24, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(134, 93, 255, 1),
        title: Text(widget.title),
      ),
      //Creation de la ligne de boutons en faisant des colonnes
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: _changeToD6,
              child: const Text('D6'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(134, 93, 255, 1),
                onPrimary: Colors.white,
              ),
            ),

            ElevatedButton(
              onPressed: _changeToD10,
              child: const Text('D10'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(134, 93, 255, 1),
                onPrimary: Colors.white,
              ),
            ),

            ElevatedButton(
              onPressed: _changeToD20,
              child: const Text('D20'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(134, 93, 255, 1),
                onPrimary: Colors.white,
              ),
            ),

            ElevatedButton(
              onPressed: _changeToD100,
              child: const Text('D100'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(134, 93, 255, 1),
                onPrimary: Colors.white,
              ),
            ),
            ],
          ),

          SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _min10,
                child: const Text('-10'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 93, 255, 1),
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _min1,
                child: const Text('-1'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 93, 255, 1),
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _reset,
                child: const Text('Reset'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 93, 255, 1),
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _plus1,
                child: const Text('+1'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 93, 255, 1),
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                onPressed: _plus10,
                child: const Text('+10'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(134, 93, 255, 1),
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),

          //Creation de la ligne qui permet d'afficher le nombre de lances
          Row(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 100, left: 10)),
              Text(
                'Nombre de $_diceType: ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25),
                
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
                'Les résultats :',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                   fontSize: 30),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: _getResultsWidgets(),
              ),
            ],
          ),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 50)),
                Text(
                  'Moyenne obtenue: ${moyenne.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18),
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
