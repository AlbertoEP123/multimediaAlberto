import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final String text;
  final String imagen;
  final double width;
  final double height;
  const Bubble(
      {super.key,
      required this.text,
      required this.imagen,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade400,
                width: 1,
              ),
            ),
            width: 75,
            height: 75,
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink.shade100,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    width: 65,
                    height: 65,
                    alignment: Alignment.center,
                    child: Image.asset(
                      width: width,
                      height: height,
                      imagen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(text),
        ],
      ),
    );
  }
}