import 'package:flutter/foundation.dart';

class Contador with ChangeNotifier {
  int _stateContador = 0;

  int get stateContador => _stateContador;
  set stateContador(int novoValor) {
    _stateContador = novoValor;
    notifyListeners();
  }
}
