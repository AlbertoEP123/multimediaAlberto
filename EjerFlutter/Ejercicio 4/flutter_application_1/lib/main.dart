import 'package:flutter/material.dart';
import 'Contenedor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'padding, alineacion',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Ejercicio 4, padding y alineacion'),
          ),
        ),
        body: Row(
          children: <Widget>[
            Contenedor(
              Colors.blue,
              80.0,
              100.0,
              'azul',
              padding:
                  const EdgeInsets.all(10.0), // Agrega el padding que quiera
              alineacion: Alignment.bottomRight, // Agrega la alineación que quiera
            ),
            Contenedor(
             Colors.pink,
              80.0,
              100.0,
              'rosa',
              padding: const EdgeInsets.only(right:40.0),
              alineacion: Alignment.center,
            ),
            Contenedor(
              Colors.green,
             80.0,
             100.0,
              'verde',
              padding: const EdgeInsets.only(left: 21),
              alineacion: Alignment.center,
              
            ),
          ],
        ),
      ),
    );
  }
}
