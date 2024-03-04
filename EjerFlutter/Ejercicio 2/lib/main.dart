import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejercicio 2 tipografia'),
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '''Capítulo 1: "Romance Dawn

El capítulo comienza con la ejecución de Gol D. Roger, el Rey de los Piratas, quien revela la existencia de su tesoro, el "One Piece," antes de ser ejecutado.
Luffy, el protagonista, se presenta como un niño que quiere convertirse en el próximo Rey de los Piratas. Tiene el poder de la Fruta del Diablo Gomu Gomu, lo que le otorga la capacidad de estirar su cuerpo como si fuera goma.
Luffy se encuentra con Coby, un joven que sueña con unirse a la Marina. Juntos, deciden partir en una aventura para alcanzar sus respectivos sueños.
Capítulo 2: "La Aventura de Coby"

Luffy y Coby llegan a la Aldea de Shell, donde Coby es esclavizado por un cruel pirata llamado Alvida. Luffy lucha contra Alvida y su tripulación para liberar a Coby.
Mientras tanto, Luffy se entera de la ubicación de un famoso cazador de piratas llamado Roronoa Zoro.
Capítulo 3: "El Capitán del Cuchillo"

Luffy encuentra a Roronoa Zoro, un espadachín que está detenido en una prisión debido a sus intentos de matar a civiles corruptos de la ciudad.
Luffy decide liberar a Zoro y le ofrece unirse a su tripulación como el espadachín. Zoro acepta la oferta, y juntos parten en busca del tesoro One Piece.''',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Text(
                    '''Capítulo 4: "Marine"

Luffy y Zoro se dirigen a un pueblo llamado Shells Town, donde se enfrentan al capitán de la Marina, Morgan, y su hijo, Helmeppo. Derrotan a Morgan y liberan a la aldea de su opresión.
Luffy y Zoro continúan su viaje hacia la Aldea de Villa Syrup en busca de un médico que se unirá a su tripulación.
Capítulo 5: "Por siempre amigos"

Luffy y Zoro llegan a la Aldea de Villa Syrup y conocen a Nami, una ladrona con habilidades de navegación que roba el oro de los piratas.
Después de una serie de acontecimientos, Nami decide unirse a la tripulación de Luffy como navegante.
Los tres se embarcan en su búsqueda del tesoro One Piece y el sueño de Luffy de convertirse en el Rey de los Piratas.''',
                    style: TextStyle(fontFamily: 'Verdana', fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
