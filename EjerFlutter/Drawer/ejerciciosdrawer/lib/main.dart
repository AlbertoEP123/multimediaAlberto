import 'package:ejerciciosdrawer/ejercicios/ejer10/lib/ejer10.dart';
import 'package:ejerciciosdrawer/ejercicios/ejer11/lib/ejer11.dart';
import 'package:ejerciciosdrawer/ejercicios/ejer12/lib/ejer12.dart';
import 'package:ejerciciosdrawer/ejercicios/ejer9/lib/ejer9.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programacion multimedia',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('9 10 11 12'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 65, 167, 250),
              ),
              child: Text(
                'Lista de ejercicios',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                  'Lista ejercicios (A partir del 9), Anteriores sin drawer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Ejercicio 9'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyGridView()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Ejercicio 10'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RandomColors()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Ejercicio 11'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FormularioRegistro()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Ejercicio 12'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdivinaNumeroFormulario()));
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Ejercicios Alberto',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
