import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_20.dart';

class DicePool20 extends DicePool {
  // Constructeur de la classe
  DicePool20() : super();

  // Méthodes de la classe
  @override
  void ajouter() {
    mesDice.add(Dice20());
  }

  @override
  void retirer() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice20 && count-- > 0);
  }

  @override
  void reset() {
    mesDice.clear();
  }

  int getPoolSize() {
    return mesDice.length;
  }
}