import 'package:ejerciciosdrawer/ejercicios/ejer10/lib/ejer10.dart';
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
      title: 'Drawer Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        title: const Text('Drawer Example'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Lista de Pantallas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Pantalla 1'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyGridView()));
                Scaffold.of(context).openDrawer(); // Abre el drawer después de seleccionar una pantalla
              },
            ),
            ListTile(
              title: const Text('Pantalla 2'),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RandomColors()));
                Scaffold.of(context).openDrawer(); // Abre el drawer después de seleccionar una pantalla
              },
            ),
           
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Pantalla Inicial',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}



