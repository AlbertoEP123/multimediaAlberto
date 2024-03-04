import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  final List<dynamic> forecastData;

  ForecastScreen({required this.forecastData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pronóstico Extendido'),
      ),
      body: ListView.builder(
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Día ${index + 1}: ${forecastData[index]['weather']}'),
            subtitle: Text('Temperatura: ${forecastData[index]['temperature']}°C'),
          );
        },
      ),
    );
  }
}