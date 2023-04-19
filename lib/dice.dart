import 'dart:math';

// La classe abstraite "Dice" représente un dé.
abstract class Dice {
  //Attributs de la classe
  int _cotes;
  int _result = 0;

  //Constructeur de la classe
  Dice(this._cotes);

  //Methodes de la classe
  int roll(){
    return Random().nextInt(_cotes)+1; // +1 car c'est entre 0 et nbr-1
  }

  //Getter & Setter
  int getCotes(){
      return _cotes;
  }

  set cotes(int valeur) {
    _cotes = valeur;
  }

  int getResult(){
    return _result;
  }

  set result(int valeur) {
  _result = valeur;
  }
}
