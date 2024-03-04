/*A la clase coche anterior define una propiedad como privada. 
Realiza el getter y el setter para poder asignar valores a esa propiedad.*/
void main(List<String> args) {
  final prueba = Coche("toyota", "auris", 2);
  print(prueba);
}

class Coche {
  late String marca;
  late String modelo;
  late int _id; //La variable privada

  Coche(String marca, String modelo, int id) {
    this.marca = marca;
    this.modelo = modelo;
    this._id = id;
  }

  String get Marca {
    return marca;
  }

  set Marca(String laMarca) {
    marca = laMarca;
  }

  String get Modelo {
    return modelo;
  }

  set Modelo(String elModelo) {
    modelo = elModelo;
  }

  int get Id {
    return _id;
  }

  set Id(int elId) {
    _id = elId;
  }

  @override
  String toString() {
    return 'Marca: ${marca}, Modelo: ${modelo}, ID: ${_id}';
  }
}
