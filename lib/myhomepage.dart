import 'package:flutter/material.dart';
import 'package:paradice/dice.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchDice() {
    setState(() {
      Dice;
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Creation de la ligne de boutons par colonnes
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: _launchDice, child: const Text('-10')),
              ElevatedButton(onPressed: _launchDice, child: const Text('-1')),
              ElevatedButton(
                  onPressed: _launchDice,
                  child: const Text(
                    'Reset',
                  )),
              ElevatedButton(onPressed: _launchDice, child: const Text('+1')),
              ElevatedButton(onPressed: _launchDice, child: const Text('+10')),
            ],
          ),
          //Creation de la ligne qui permet d'afficher le nombre de lances
          Row(
            children: const <Widget>[
              Padding(padding: EdgeInsets.only(top: 100, left: 10)),
              Text(
                'Nombre de D6: ',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                '###',
                style: TextStyle(
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

          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text('Nombre de 1: '),
                    Text('Nombre de 2: '),
                    Text('Nombre de 3: '),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Text('Nombre de 4: '),
                        Text('Nombre de 5: '),
                        Text('Nombre de 6: '),
                      ],
                    )
                  ],
                )
              ],
            ),
          ]),

          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              children: const <Widget>[
                Text(
                  'Moyenne obtenue: ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '####',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ]),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _launchDice,
        tooltip: 'J\'ai de la chance !',
        child: const Icon(Icons.casino),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
