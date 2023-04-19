import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_10.dart';

class DicePool10 extends DicePool {
  // Constructeur de la classe
  DicePool10() : super();

  // Méthodes de la classe
  @override
  void ajouterDe6() {
    // Pas utiliser
  }

  @override
  void ajouterDe10() {
    mesDice.add(Dice10());
  }

  @override
  void retirerDe6() {
    // Pas utiliser
  }

  @override
  void retirerDe10() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice10 && count-- > 0);
  }

  @override
  void lancerDes() {
    mesDice.forEach((dice) => dice.roll());
  }

  @override
  void reset() {
    mesDice.clear();
  }

  List<int> getResults() {
  return mesDice.map((dice) => dice.getResult()).toList();
  }

  int getPoolSize() {
  return mesDice.length;
  }


}
