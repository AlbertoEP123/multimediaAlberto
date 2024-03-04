//Investiga cómo podría generarse un valor aleatorio entre 1 y 10.
import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int valorRandom = Random().nextInt(10) + 1;
  print("Numero aleatorio :$valorRandom");

  //extra adivina el numero
  int valorAAdivinar = Random().nextInt(10) + 1;
  print("Adivina el numero del 1 al 10: ");

  var numUsuario;
  do {
    int numUsuario = int.parse(stdin.readLineSync().toString());

    if (numUsuario == valorAAdivinar) {
      print("Enhorabuena!! acertaste el numero $valorAAdivinar");
      break;
    } else {
      print("Ese no es el numero, intentalo de nuevo: ");
    }
  } while (numUsuario != valorAAdivinar);
}
