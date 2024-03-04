import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejercicio 3'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:
                          10.0), // Añade espacio entre la imagen y la parte superior del contenedor
                  Container(
                    height: 130,
                    child: Image.asset('monalisa.jpg'),
                  ),
                  const Text('Monalisa',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:
                          10.0), // Añade espacio entre la imagen y la parte superior del contenedor
                  Container(
                    height: 130,
                    child: Image.asset('elgrito.jpg'),
                  ),
                  const Text('El Grito',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
