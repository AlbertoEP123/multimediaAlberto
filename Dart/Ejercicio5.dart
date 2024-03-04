import 'dart:io';

/*
Crea un programa que reciba una lista de números por teclado y 
los introduzca en un array. Visualiza los resultados.
*/
void main() {
  List<int> numeros = [];
  print("Dime de el tamaño del array");
  int entrada2 = int.parse(stdin.readLineSync().toString());

  for (int i = 0; i < entrada2; i++) {
    print(
        "Introduce el numero que quiere introducir " + "$i" + "/" "$entrada2");
    int entrada = int.parse(stdin.readLineSync().toString());

    numeros.add(entrada);
  }

  print("La lista es: ${numeros}");
}
