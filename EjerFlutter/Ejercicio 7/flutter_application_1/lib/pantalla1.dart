import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 1'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imagenesConTextos('assets/rana1.jpg', 'Rana'),
            imagenesConTextos('assets/rosa.webp', 'Rosa'),
            imagenesConTextos('assets/malagag.webp', 'Malaga'),
            imagenesConTextos('assets/java.webp', 'Java'),
          ],
        ),
      ),
      drawer: const DrawerPersonalizado(), // Incluir el Drawer aquí también
    );
  }

  // Funcion que crea imagen con tamaño especifico y texto abajo
  Widget imagenesConTextos(String imageUrl, String text) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 8),
        Text(text),
        SizedBox(height: 16),
      ],
    );
  }
}
