import 'dart:math';

// La classe "Dice" représente un dé.
class Dice {
// Attributs de la classe
  int _cotes = 6;
// Constructeur de la classe
  Dice(this._cotes);
// Méthodes de la classe
  int roll() {
    final random = Random();
    return random.nextInt(_cotes) + 1;
  }
}
