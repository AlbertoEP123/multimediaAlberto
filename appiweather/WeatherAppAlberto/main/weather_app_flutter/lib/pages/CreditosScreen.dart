import 'package:flutter/material.dart';

class CreditosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Weather App\n\nDesarrollado por Alberto Enrique pulido\n\nDel curso 2ºDAM IES Pablo picasso para la asignatura de programacion movil.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
