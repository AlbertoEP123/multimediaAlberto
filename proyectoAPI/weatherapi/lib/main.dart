import 'package:flutter/material.dart';
import 'package:weatherapi/home.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreenWithDrawer(), // Utiliza HomeScreenWithDrawer como la pantalla de inicio
    );
  }
}