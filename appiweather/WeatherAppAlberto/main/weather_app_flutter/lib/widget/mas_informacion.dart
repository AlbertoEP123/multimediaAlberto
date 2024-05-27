import 'dart:ui';

import 'package:flutter/material.dart';
import '../utils/costantes.dart';

Widget masInformacion({
  required String viento,
  required String humedad,
  required String sensacion,
  required String temp_min,
  required String temp_max,
  required double width,
  required double height,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        width: width,
        height: height / 4,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white, width: 1.9)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Viento", style: fuenteMasInfo),
                Text("Humedad", style: fuenteMasInfo),
                Text("Sensacion", style: fuenteMasInfo),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(viento, style: fuenteMasInfo),
                Text(humedad, style: fuenteMasInfo),
                Text(sensacion, style: fuenteMasInfo),
                Text(temp_min, style: fuenteMasInfo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Temp minima", style: fuenteMasInfo),
                Text("Temp maxima", style: fuenteMasInfo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(temp_min, style: fuenteMasInfo),
                Text(temp_max, style: fuenteMasInfo),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
