import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_6.dart';

class DicePool6 extends DicePool {
  // Constructeur de la classe
  DicePool6() : super();

  // Méthodes de la classe
  @override
  void ajouterDe6() {
    mesDice.add(Dice6());
  }

  @override
  void ajouterDe10() {
    // Pas utiliser
  }

  @override
  void retirerDe6() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice6 && count-- > 0);
  }

  @override
  void retirerDe10() {
    // Pas utiliser
  }

  @override
  void reset() {
    mesDice.clear();
  }

  int getPoolSize() {
    return mesDice.length;
  }
}
