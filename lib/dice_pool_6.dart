import 'package:paradice/dice_pool.dart';
import 'package:paradice/dice_6.dart';

class DicePool6 extends DicePool {
  // Constructeur de la classe
  DicePool6() : super();

  // Méthodes de la classe
  @override
  void ajouter() {
    mesDice.add(Dice6());
  }

  @override
  void retirer() {
    int count = 1;
    mesDice.removeWhere((dice) => dice is Dice6 && count-- > 0);
  }

  // Les méthodes ajouterDeX et retirerDeX ne sont pas nécessaires ici, car elles sont définies dans la classe de base DicePool.
  // Vous pouvez les supprimer en toute sécurité.

  @override
  void reset() {
    mesDice.clear();
  }

  int getPoolSize() {
    return mesDice.length;
  }
}
