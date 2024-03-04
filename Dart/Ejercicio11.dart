/*
Crea una clase Persona que tenga como datos: nombre, apellidos, DNI, dirección, 
CP, ciudad, fecha de nacimiento. Tenemos que definir una clase Alumno que herede 
de Persona y añada la información código del alumno, estudios (ESO, Bachillerato, 
Ciclo Formativo), curso y edad, que se calculará a partir de la fecha de nacimiento 
que se ha introducido y que es de tipo privado a la clase.
*/
void main(List<String> args) {
  DateTime fechaNac = DateTime(1981, 2, 2);
  Alumno manolo = Alumno("Manolo", "Gutierrez", "2683452M", "Calle pepe n15",
      29001, "grana", fechaNac, 2, 2, fechaNac.year, "ESO");

  print(manolo);
  print("\tSu edad es: " + manolo.calcularEdad().toString());
}

class Persona {
  late String nombre;
  late String apellidos;
  late String DNI;
  late String direccion;
  late int cp;
  late String ciudad;
  late DateTime fechaNacimiento;

  Persona(this.nombre, this.apellidos, this.DNI, this.direccion, this.cp,
      this.ciudad, this.fechaNacimiento);

  int calcularEdad() {
    DateTime fechaActual = DateTime.now();
    int edad = fechaActual.year - fechaNacimiento.year;
    return edad;
  }

  @override
  String toString() {
    return 'Nombre: $nombre. Apelidos: $apellidos. \n DNI: $DNI. Dirección: $direccion. Código Postal: $cp. \n Ciudad: $ciudad. Fecha de Nacimiento: $fechaNacimiento.';
  }
}

class Alumno extends Persona {
  late int codigo;
  late String estudios;
  late int curso;
  late int edad;

  Alumno(
      String nombre,
      String apellidos,
      String DNI,
      String direccion,
      int CP,
      String ciudad,
      DateTime fechaNacimiento,
      this.codigo,
      this.curso,
      this.edad,
      this.estudios)
      : super(nombre, apellidos, DNI, direccion, CP, ciudad, fechaNacimiento);
}
