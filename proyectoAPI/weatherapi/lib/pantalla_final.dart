import 'package:flutter/material.dart';
import 'package:weatherapi/auth.manager.dart';
import 'package:weatherapi/drawer_widget.dart';

class AboutScreen extends StatelessWidget {
  final AuthManager authManager;

  const AboutScreen({Key? key, required this.authManager})
      : super(key: key); // Agrega un constructor que reciba AuthManager

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla final, documentacion'),
      ),
      body: const Center(
        child: Text(
          'Weather App - Información de la aplicación',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: DrawerWidget(
        authManager:
            authManager, // Pasa la instancia de AuthManager al DrawerWidget
      ),
    );
  }
}
