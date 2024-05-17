import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Mueve el punto inicial al extremo izquierdo
    path.moveTo(0, 0);

    // Agrega una curva cuadrática hacia abajo y hacia la derecha para formar el lado izquierdo de la "U"
    path.quadraticBezierTo(size.width / 2 - 75, size.height, size.width / 2, size.height);

    // Agrega una curva cuadrática hacia abajo y hacia la izquierda para formar el lado derecho de la "U"
    path.quadraticBezierTo(size.width / 2 + 75, size.height, size.width, 0);

    // Cierra el path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}