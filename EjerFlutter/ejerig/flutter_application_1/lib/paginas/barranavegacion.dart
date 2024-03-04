import 'package:flutter/material.dart';

class BarraNavegacion extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

// constructor necesario para configurar el indice seleccionado actualmente
  const BarraNavegacion({
    required this.currentIndex, // icono resaltado
    required this.onTap, // clicar en el elemento
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        // Array de tres elemenos con tu icono y label
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Perfil'),
        BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Finalización'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
