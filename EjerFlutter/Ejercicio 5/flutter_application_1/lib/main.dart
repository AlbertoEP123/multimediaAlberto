import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 5',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ejercicio 5, método transform'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Contenedor azul con transformación de rotación
              Transform.rotate(
                angle: 6, // ángulo
                child: Container(
                  width: 160,
                  height: 100,
                  color: Colors.blue,
                ),
              ),

              // Contenedor rojo con transformación de escala
              Transform.scale(
                scale: 2, // Escala 2 veces el tamaño original
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
