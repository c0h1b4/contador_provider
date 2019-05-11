import 'package:flutter/material.dart';
import 'package:novo_teste/colorDecider.dart';
import 'package:novo_teste/weatherInfo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("construiu o scaffold");
    return ChangeNotifierProvider(
      builder: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySpecialText(),
              MySpecialContent(),
              MySpecialHeading(),
            ],
          ),
        ),
        floatingActionButton: MyFloatActionButton(),
      ),
    );
  }
}

class MySpecialText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("construiu specialtext");

    return Text(
      "A temperatura agora é:",
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget with ColorDecider {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<WeatherInfo>(builder: (context, weatherInfo, _) {
        print("construiu heading");
        return Text(
          weatherInfo.temperatureType,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: decideColor(weatherInfo),
          ),
        );
      }),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("construiu content");
    WeatherInfo weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weatherInfo.temperatureVal.toString(),
        style: TextStyle(
          fontSize: 44.0,
        ),
      ),
    );
  }
}

class MyFloatActionButton extends StatelessWidget with ColorDecider {
  @override
  Widget build(BuildContext context) {
    print("construiu button");
    WeatherInfo weatherInfo = Provider.of<WeatherInfo>(context);
    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      onPressed: () {
        String newWeatherType =
            weatherInfo.temperatureType == "celsius" ? "fahrenheit" : "celsius";
        weatherInfo.type = newWeatherType;
      },
      tooltip: 'Change Type',
      child: Icon(
        Icons.change_history,
      ),
    );
  }
}
