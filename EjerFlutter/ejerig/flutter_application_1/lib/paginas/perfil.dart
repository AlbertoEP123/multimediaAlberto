import 'package:flutter/material.dart';
import 'package:flutter_application_1/paginas/perfilbody.dart';
import 'barranavegacion.dart';
import 'pantallaInicio.dart';
import 'pantallafinalizacion.dart';

class Perfil extends StatelessWidget {
  final String nombre; // Variables necesarias
  final int publicaciones;
  final int seguidores;
  final int seguidos;

  const Perfil({
    this.nombre = 'Yúbal F.M.',
    this.publicaciones = 996,
    this.seguidores = 445,
    this.seguidos = 242,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // Defino contenedor
            padding: const EdgeInsets.all(16),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/4.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Lo alineamos a la izq
                    children: [
                      Text(
                        nombre,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        // Fila nueva para la seccion de publi, seg..

                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly, //Alineacion
                        children: [
                          Text(
                            '$publicaciones\nPublicaciones', // Llamamos al valor del constructor
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            '$seguidores\nSeguidores',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 1),
                          Text(
                            '$seguidos\nSeguidos',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(
                        // espaciado
                        height: 8,
                      ),
                      Padding(
                        // creo editar perfil
                        padding: const EdgeInsets.only(left: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 148, 148, 148),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 240,
                                height: 28,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Editar perfil',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.grey),
          Expanded(
            child: PerfilBody(),
          ),
        ],
      ),
      bottomNavigationBar: BarraNavegacion(
        currentIndex: 1, // aqui indica que el index de la pagina es el 1.
        onTap: (index) {
          handleNavigation(context, index);
        },
      ),
    );
  }

// Metodo usado en todas las paginas para manejar la navegacion
// entre diferentes pantallas según el indice proporcionado
// context: accede al contexto de flutter, index: pantalla a la que navega
// navigator.plush y material pageroute hace las transiciones
  void handleNavigation(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaInicio()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PantallaFinalizacion()),
      );
    }
  }
}
