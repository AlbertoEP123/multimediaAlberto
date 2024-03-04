import 'dart:io';

/*
  Realiza una función que se le pase un valor y salga por pantalla 
  la tabla de multiplicar de ese número.
  */
void multiplicacion(int num) {
  for (var i = 0; i < 11; i++) {
    print("$num * $i = ${num * i}");
  }
}

void main() {
  print("Dime el número del que desea mostrar la tabla de multiplicar");
  int num = int.parse(stdin.readLineSync().toString());
  multiplicacion(num);
}
