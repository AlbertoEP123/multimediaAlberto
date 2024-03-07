import 'package:flutter/material.dart';
import 'package:weatherapi/api_weather.dart';
import 'pantalla_final.dart';
import 'home.dart';

import 'package:weatherapi/auth.manager.dart'; // Asegúrate de importar AuthManager
// Asegúrate de importar HomeScreenWithDrawer

class DrawerWidget extends StatelessWidget {
  final AuthManager authManager; // Debes recibir AuthManager aquí

  const DrawerWidget({Key? key, required this.authManager})
      : super(key: key); // Asegúrate de recibir AuthManager en el constructor

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/weather.jpg'), // Agrega la imagen de encabezado desde los assets
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Pantalla de Inicio'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreenWithDrawer(
                          authManager:
                              authManager, // Pasa authManager en lugar de prefs
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.api),
            title: const Text('Api'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          username: '',
                          authManager: authManager,
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Pantalla de Finalizacion'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AboutScreen(
                          authManager: authManager,
                        )),
              );
            },
          ),
        ],
      ),
    );
  }
}
