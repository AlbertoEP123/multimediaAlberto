/*
Crea un array con los valores del 1 al 50. Crea un nuevo array que recorra
el array anterior e introduzca en el nuevo array los números divisibles por 3.
*/

void main() {
  List<int> array = [];
  for (int i = 0; i < 51; i++) {
    array.add(i);
  }
  List<int> divisibles = [];

  for (int i = 0; i < array.length; i++) {
    if (i % 3 == 0) {
      divisibles.add(i);
    }
  }
  print("Del 1 al 50 los disivisbles de 3 son: ${divisibles}");
}
