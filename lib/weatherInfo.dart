import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier {
  // Variáveis
  String _tempType = "celcius";
  int _temperatureVal = 25;

  // Getters
  int get temperatureVal => _temperatureVal;
  String get temperatureType => _tempType;

  // Setters
  set temperature(int newTemp) {
    _temperatureVal = newTemp;
    notifyListeners();
  }

  set type(String newType) {
    _tempType = newType;
    notifyListeners();
  }
}
