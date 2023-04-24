import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_100.dart';

class DicePool100 extends DicePool {
  // Constructeur de la classe
  DicePool100() : super();

  // Méthodes de la classe
  @override
  void ajouter() {
    mesDice.add(Dice100());
  }

  @override
  void retirer() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice100 && count-- > 0);
  }

  @override
  void reset() {
    mesDice.clear();
  }

  int getPoolSize() {
    return mesDice.length;
  }
}