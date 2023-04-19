import 'package:paradice/dice.dart';

abstract class DicePool {
  //Attributs de la classe
  List<Dice> _mesDice = [];
  List<int> _results = [];

  //Getter
  List<Dice> get mesDice => _mesDice;

  //Méthodes de la classe
  void ajouterDe6();
  void ajouterDe10();
  void retirerDe6();
  void retirerDe10();

  void lancerDes() {
    _results.clear(); // Réinitialiser la liste des résultats

    for (Dice dice in _mesDice) {
      int result = dice.roll();
      dice.result = result; // Stocker le résultat dans l'objet Dice
      _results.add(result);
    }
  }


  void reset();

  List<int> getResults() {
    return _results;
  }
}

