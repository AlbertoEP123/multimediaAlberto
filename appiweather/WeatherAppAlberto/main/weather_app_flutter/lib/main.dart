import 'package:flutter/material.dart';
import 'package:weather_app_flutter/pages/pagina_inicio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistroScreen(), // Cargar Pantalla1 al inicio
    );
  }
}
