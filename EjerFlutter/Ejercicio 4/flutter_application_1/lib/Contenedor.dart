import 'package:flutter/material.dart';

class Contenedor extends StatelessWidget {
  final Color color;
  final double alto;
  final double ancho;
  final String texto;
  // Creo variable de padding, de tipo edge insets que esto crea
  // espacios y margenes para cualquier widget, ? para indicar que puede ser nulo
  final EdgeInsetsGeometry? padding;  
 // creo variable tipo aligment, para alinear los contenedores
  final AlignmentGeometry? alineacion;

   Contenedor(
    this.color,
    this.alto,
    this.ancho,
    this.texto, { /*Valores de padding y alineacion
    que se apliquen al texto(corregido) */
    this.padding,    
    this.alineacion
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: ancho,
      height: alto,
      alignment: alineacion,
      child: Padding( //Lo inicializamos a null
        padding: padding ?? EdgeInsets.zero,
        child: Center(
          child: Text(texto),
        ),
      ),
    );
  }
}
