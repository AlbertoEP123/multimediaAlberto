import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import '../utils/costantes.dart';

Widget clima_actual(
    {required VoidCallback onPressed,
    required String? temp,
    required String? ciudad,
    required String? pais,
    required String? status,
    required double width,
    required double height}) {
  return Container(
    width: width / 0.9,
    child: Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("$ciudad, $pais", style: fuenteTitulo),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        CupertinoIcons.refresh,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
              Text("${temp}°", style: fuenteTemperatura),
            ],
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: width / 10,
            height: height / 13,
            child: RotatedBox(
              quarterTurns: -1,
              child: Center(
                child: Text(
                  status!,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
