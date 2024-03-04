import 'dart:io';

/*
Repite el ejercicio anterior impidiendo que se introduzca 
en el array valores repetidos.
*/

void main() {
  List<int> numeros = [];
  print("Dime el tamaño de la lista");
  int entrada2 = int.parse(stdin.readLineSync().toString());

  for (int i = 0; i < entrada2; i++) {
    int entrada;
    bool repetido = false;
    do {
      print("Introduce el número que quieres agregar ($i/$entrada2): ");
      entrada = int.parse(stdin.readLineSync().toString());

      repetido = numeros.contains(entrada);
      if (repetido) {
        print("Introduce otro número ");
      }
    } while (repetido);
    numeros.add(entrada);
  }

  print("Lista : $numeros");
}
