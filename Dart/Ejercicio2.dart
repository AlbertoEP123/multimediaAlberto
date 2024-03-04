void main() {
  /*
 Cuando se realiza una declaración sin realizar una asignación, se produce un error. 
 Soluciona este error mediante el uso de null safety.
 */
//int a; Es null, daria error al hacerle print y no se podría ejecutar

//Con null safety
  int? a = null;
  print(a);
}
