
import 'dart:io';
void main() {
  print("Dime tu nombre: ");
  var variable = stdin.readLineSync().toString();
  print("Tu nombre es:  $variable" );
  
  print("Vamos a sumar dos numeros, dime el primero: ");
  int num1 = int.parse(stdin.readLineSync().toString());
  print("Segundo valor: ");
  int num2 = int.parse(stdin.readLineSync().toString());
  print("El resultado es: ");
  print(num1 + num2);

List<dynamic> listaDinamica = [1,2,3,"hola"];
print(listaDinamica);
}