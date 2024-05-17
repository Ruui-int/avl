// ignore: file_names
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'nodo.dart';
import 'avl.dart';

class ArbolPainter extends CustomPainter {
  ArbolAvl arbol = ArbolAvl();
  static const double diametro = 27;
  static const double radio = diametro / 2;
  static const int ancho = 20;

  ArbolPainter(ArbolAvl avl) {
    arbol = avl;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (arbol.raiz != null) {
      pintar(canvas, size.width / 2, 20, arbol.raiz);
    }
  }

  @override
  bool shouldRepaint(ArbolPainter oldDelegate) => true;

  void pintar(Canvas canvas, double x, double y, Nodo? nodo) {
    if (nodo != null) {
      Paint circuloBorde = Paint()
        ..color = const Color(0xff278ea5)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      Paint circuloBordeUltimo = Paint()
        ..color = const Color.fromARGB(255, 214, 2, 2)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      Paint circulo = Paint()
        ..color = const Color.fromARGB(255, 255, 255, 255)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 0;

      Paint linea = Paint()
        ..color = const Color.fromARGB(255, 210, 67, 5)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 1.5;

      const textStyle = TextStyle(
        color: Color(0xff1f4287),
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

      final textSpan = TextSpan(
        text: nodo.clave,
        style: textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout(
        minWidth: x,
        maxWidth: x,
      );

      /* if (textSpan.length == 1){
        
      } */
      final offsetText = Offset(x - 4, y - 8);

      double ajuste = 2 * (ancho / 3);
      double ajusteIzq = 0;
      double ajusteDer = 0;

      if (nodo.nodoIzquierdo != null) {
        ajusteIzq = ajustarIzq(nodo, ajusteIzq, ajuste);
        canvas.drawLine(
            Offset(x + radio, y - radio),
            Offset(
                x - ancho - ajusteIzq - radio + 5, y + ancho + diametro + 20),
            linea);
      }

      if (nodo.nodoDerecho != null) {
        ajusteDer = ajustarDer(nodo, ajusteDer, ajuste);
        canvas.drawLine(
            Offset(x + radio, y + radio * 0.2),
            Offset(
                x + ancho + ajusteDer + radio - 5, y + ancho + diametro + 15),
            linea);
      }

      canvas.drawCircle(Offset(x, y), diametro, circulo);
      canvas.drawCircle(Offset(x, y), diametro, circuloBorde);
      textPainter.paint(canvas, offsetText);

      if (nodo.ultimo) {
        canvas.drawCircle(Offset(x, y), diametro, circuloBordeUltimo);
      }

      pintar(canvas, x - ancho - ajusteIzq, y + ancho + 35, nodo.nodoIzquierdo);
      pintar(canvas, x + ancho + ajusteDer, y + ancho + 35, nodo.nodoDerecho);
    }
  }

  double ajustarDer(Nodo nodo, double ajusteDer, double ajuste) {
    if (nodo.nodoDerecho != null) {
      if (nodo.nodoDerecho!.nodoIzquierdo != null) {

        return ajusteDer = ajustarDerAux(nodo.nodoDerecho!.nodoIzquierdo!, ajusteDer);
      }
    }
    return ajusteDer = ajuste;
  }

  double ajustarDerAux(Nodo nodo, double ajustarDer) {
    double extra = ajustarDer;
    extra = diametro * 1.8;
    extra = extra * 1.6;
    if (nodo.nodoIzquierdo != null) {
      extra = extra + ajustarDerAux(nodo.nodoIzquierdo!, extra);
    }
    return extra;
  }

  double ajustarIzq(Nodo nodo, double ajusteIzq, double ajuste) {
    if (nodo.nodoIzquierdo != null) {
      if (nodo.nodoIzquierdo!.nodoDerecho != null) {
        return ajusteIzq = ajustarDerAux(nodo.nodoIzquierdo!.nodoDerecho!, ajusteIzq);
      }
    }
    return ajusteIzq = ajuste;
  }

  double ajustarIzqAux(Nodo nodo, double ajustarIzq) {

    double extra = ajustarIzq;
    extra = diametro * 1.8;
    extra = extra * 1.6;
    if (nodo.nodoDerecho != null) {
      extra = (diametro + ajustarDerAux(nodo.nodoDerecho!, extra));
    }
    return extra;
  }

}
