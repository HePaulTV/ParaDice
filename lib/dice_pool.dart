import 'package:paradice/dice.dart';

abstract class DicePool {
  //Attributs de la classe
  List<Dice> _mesDice = [];
  List<int> _results = [];

  //Getter
  List<Dice> get mesDice => _mesDice;

  //Méthodes de la classe
  void ajouterDe6() {
    ajouter();
  }

  void ajouterDe10() {
    ajouter();
  }

  void ajouterDe20() {
    ajouter();
  }

  void ajouterDe100() {
    ajouter();
  }

  void retirerDe6() {
    retirer();
  }

  void retirerDe10() {
    retirer();
  }

  void retirerDe20() {
    retirer();
  }

  void retirerDe100() {
    retirer();
  }

  void lancerDes() {
    _results.clear(); // Réinitialiser la liste des résultats

    for (Dice dice in _mesDice) {
      int result = dice.roll();
      dice.result = result; // Stocker le résultat dans l'objet Dice
      _results.add(result);
    }
  }

  int getPoolSize() {
    return _mesDice.length;
  }

  void ajouter() {}

  void retirer() {}

  void reset() {
    _mesDice.clear();
  }

  List<int> getResults() {
    return _results;
  }
}
