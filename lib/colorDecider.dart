import 'package:flutter/material.dart';
import 'package:novo_teste/weatherInfo.dart';

class ColorDecider {
  Color decideColor(WeatherInfo weatherInfo) {
    return weatherInfo.temperatureType == "celsius"
        ? Colors.green
        : Colors.deepOrange;
  }
}
