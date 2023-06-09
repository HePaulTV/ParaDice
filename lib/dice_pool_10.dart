import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_10.dart';

class DicePool10 extends DicePool {
  // Constructeur de la classe
  DicePool10() : super();

  // Méthodes de la classe
  @override
  void ajouter() {
    mesDice.add(Dice10());
  }

  @override
  void retirer() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice10 && count-- > 0);
  }

  @override
  void reset() {
    mesDice.clear();
  }

  int getPoolSize() {
    return mesDice.length;
  }
}
