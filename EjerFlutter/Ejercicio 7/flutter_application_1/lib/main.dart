import 'package:flutter/material.dart';
import 'pantalla1.dart';
import 'pantalla2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ejercicio 7 - Drawer',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
        ),
        // llamo a inicio
        home: const Inicio(),
        debugShowCheckedModeBanner: false);
  }
}

// clase inicio que llama al drawer
class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        leading: Builder(
          // contruyo un estado y el menu
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              //al estar presionado el esatado cambia
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: const Center(
        child: Text('Bienvenido a la pantalla de inicio'),
      ),
      drawer: DrawerPersonalizado(),
    );
  }
}

// clase del drawer
class DrawerPersonalizado extends StatelessWidget {
  const DrawerPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // cabecera drawer
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // listado de las opciones del driwert
          ListTile(
            title: const Text('1 submenú'),
            // al clicar, se cambia el estado y llamamos a pantalla1 o pantalla 2
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Pantalla1(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('2 submenú'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Pantalla2(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
