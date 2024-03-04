/*Realiza la implementación de la clase abstracta vehículo. De esta clase heredan 
la clase motocicleta y la clase coche. Establece propiedades en cada una de las clases 
y sobreescribe alguna de ellas para que compruebes el funcionamiento de las clases en Dart.*/
void main(List<String> args) {
  final moto = new Motocicleta("test", "lol", 2000, 49);
  final coche = new Coche("Toyota", "Ibra", 2020, 6);

  print(coche.toString());
  print(moto.toString());
}

abstract class Vehiculo {
  late String marca;
  late String modelo;
  late int anio;

  Vehiculo(this.marca, this.modelo, this.anio);

  @override
  String toString() {
    return "Marca: $marca, Modelo: $modelo, Año: $anio";
  }
}

class Motocicleta extends Vehiculo {
  int cilindrada;
  Motocicleta(String marca, String modelo, int anio, this.cilindrada)
      : super(marca, modelo, anio);

  String toString() {
    return "Moto: " + super.toString() + " Cilindrada: $cilindrada";
  }
}

class Coche extends Vehiculo {
  int plazas;
  Coche(String marca, String modelo, int anio, this.plazas)
      : super(marca, modelo, anio);

  String toString() {
    return "Coche: " + super.toString() + " Plazas: $plazas";
  }
}
