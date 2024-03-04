import 'package:flutter/material.dart';

class historiasdestacadas extends StatelessWidget {
  final String text;
  final String imagen;
  final double width;
  final double height;

  const historiasdestacadas({
    Key? key,
    required this.text,
    required this.imagen,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 90,  // Puedes ajustar este ancho según tus necesidades
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               
              ),
              width: 70,
              height: 70,
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                 
                  border: Border.all(
                    
                    width: 1,
                  ),
                ),
                width: 70,
                height: 70,
                alignment: Alignment.center,
                child: Image.asset(
                  imagen,
                  width: width,
                  height: height,
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(text),
          ],
        ),
      ),
    );
  }
}
