import 'package:flutter/material.dart';
import 'pantallafinalizacion.dart';
// ignore: unnecessary_import
import 'package:flutter/src/material/icons.dart';

import 'perfil.dart';

class PantallaInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Instagram',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 45),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/fotooriginal.png',
                width: 1500,
                height: 550,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            handleNavigation(context, index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cuenta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Finalización',
            ),
          ],
        ),
      ),
    );
  }

  void handleNavigation(BuildContext context, int index) {
    if (index == 0) {
      // Puedes agregar lógica adicional si es necesario para la página de inicio
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Perfil()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaFinalizacion()),
      );
    }
  }
}