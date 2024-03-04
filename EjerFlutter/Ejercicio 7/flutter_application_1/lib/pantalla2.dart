import 'package:flutter/material.dart';

import 'main.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
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
            imagenesConTextos('assets/luffy.webp', 'Luffy One Piece'),
            imagenesConTextos('assets/zoro.webp', 'Zoro One Piece'),
            imagenesConTextos('assets/sanji.webp', 'Sanji One Piece'),
            imagenesConTextos('assets/franky.webp', 'Franky One Piece'),
          ],
        ),
      ),
      drawer: DrawerPersonalizado(),
    );
  }

// Funcion que crea imagen con tamaño especifico y texto abajo
  Widget imagenesConTextos(String imageUrl, String text) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          width: 190,
          height: 190,
        ),
        const SizedBox(height: 8),
        Text(text),
        SizedBox(height: 16),
      ],
    );
  }
}
