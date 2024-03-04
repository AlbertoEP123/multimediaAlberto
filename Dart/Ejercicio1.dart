void main() {
  /*
 Crea un programa en el que declares y asignes todos los tipos 
 predefinidos de variables que permite DART. Realiza operaciones
 matemáticas entre ellos y comprueba si puedes operar entre todos los
  tipos sin problemas.
  */
  //variables predefinidas

  int entero = 5;
  double puntoF = 2.9;
  String cadena = "ejercicio 1 ";
  bool booleano = true;
  var dinamica = "String de variable dinamica ";
  var dinamica2 = 9;
  //Lista
  List<int> lista = [1, 3, 5];

  //Se puede hacer operaciones entre enteros y doubles
  print("Suma int($entero) y double($puntoF): ${entero + puntoF}");

  print("Resta int($entero) y double($puntoF): ${entero - puntoF}");

  print("Multplicación int($entero) y double($puntoF): ${entero * puntoF}");

  print("División int($entero) y double($puntoF): ${entero / puntoF}");

  //Puedo juntar un string con la variable dinamica (porque la dinamica es un string)
  print("String $cadena + $dinamica: ${cadena + dinamica}");

  //Ahora con la dinamica2 si puedo hacer operaciones con int y double, porque la dinamica es un entero.
  print(
      "Operaciones con variables dinamicas: $entero + $dinamica2: ${entero + dinamica2}");
  print("$puntoF + $dinamica2: ${entero + dinamica2}");

  /*Los booleanos no se puede operar con nada, los enteros y puntos flotantes entre ellos si, la dinamica depende del valor 
  como expliqué previamente, y los String con otros string.
  Algunos ejemplos:

  print(booleano + entero);
  print(entero + cadena);
  print(dinamica - entero);
  */
}
