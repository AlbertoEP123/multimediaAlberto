import 'package:flutter/material.dart';

import 'barranavegacion.dart';
import 'pantallaInicio.dart';
import 'perfil.dart';

class PantallaFinalizacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contenido de finalización',
              style: TextStyle(fontSize: 30, fontFamily: 'spongebob'),
            ),
            SizedBox(height: 20), // Espaciado entre el texto y los créditos
            Text(
              'Créditos: Alberto Enrique Pulido 2ºDAM',
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 221, 181, 5),
                  fontFamily: 'spongebob'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BarraNavegacion(
        currentIndex: 2,
        onTap: (index) {
          handleNavigation(context, index);
        },
      ),
    );
  }

  void handleNavigation(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaInicio()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Perfil()),
      );
    }
  }
}
