import 'package:flutter/material.dart';
import 'package:weatherapi/api_weather.dart';
import 'pantalla_final.dart';
import 'home.dart';

import 'package:weatherapi/auth.manager.dart';

class DrawerWidget extends StatelessWidget {
  final AuthManager authManager;

  const DrawerWidget({Key? key, required this.authManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/weather.jpg'),
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
                          authManager: authManager,
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
