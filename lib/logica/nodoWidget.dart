import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Nodo extends StatelessWidget {

  //Propiedades del nodo
  double valorX;
  double valorY;
  int nivel = 1;
  Nodo? nodoIzquierdo;
  Nodo? nodoDerecho;
  String clave;
  
  //Constructor
  Nodo({super.key, 
    required this.valorX, 
    required this.valorY, 
    required this.clave,
  });


  //Forma del widget
  @override
  Widget build(BuildContext context) {
    const double diameter = 50;
    const color = Colors.blue;

    return Positioned(
      left: valorX,
      top: valorY, 
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: const Color.fromARGB(255, 84, 15, 144),
            width: 4, 
          ),
        ),
        child: Center(
          child: Text(
            clave,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}
