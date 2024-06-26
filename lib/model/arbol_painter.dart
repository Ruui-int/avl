import 'package:flutter/material.dart';
import 'nodo.dart';
import 'avl.dart';

class ArbolPainter extends CustomPainter {
  late ArbolAvl arbol;
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
        ..color = const Color.fromARGB(255, 56, 71, 98)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      Paint circuloBordeUltimo = Paint()
        ..color = const Color.fromARGB(255, 238, 108, 122)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      Paint circuloBordeBuscanodo = Paint()
        ..color = const Color.fromARGB(255, 217, 179, 13)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      Paint circulo = Paint()
        ..color = const Color.fromARGB(255, 247, 248, 250)
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.fill
        ..strokeWidth = 0;

      Paint linea = Paint()
        ..color = const Color.fromARGB(255, 71, 147, 151)
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 3;

      const textStyle = TextStyle(
        color: Color.fromARGB(255, 56, 71, 98),
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );

      final textSpan = TextSpan(
        text: nodo.clave.toString(),
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

      var offsetText = Offset(x - 30, y - 14);

      if (nodo.clave.toString().length == 1) {
        offsetText = Offset(x - 6.5, y - 14);
      }
      if (nodo.clave.toString().length == 2) {
        offsetText = Offset(x - 14, y - 14);
      }
      if (nodo.clave.toString().length == 3) {
        offsetText = Offset(x - 21, y - 14);
      }

      double ajuste = 2 * (ancho / 3);
      double ajusteIzq = 0;
      double ajusteDer = 0;

      if (nodo.nodoIzquierdo != null) {
        ajusteIzq = ajustarIzq(nodo, ajusteIzq, ajuste);
        canvas.drawLine(
            Offset(x, y),
            Offset(
                x - ancho - ajusteIzq - radio + 10, y + ancho + diametro + 15),
            linea);
      }

      if (nodo.nodoDerecho != null) {
        ajusteDer = ajustarDer(nodo, ajusteDer, ajuste);
        canvas.drawLine(
            Offset(x, y),
            Offset(
                x + ancho + ajusteDer + radio - 10, y + ancho + diametro + 15),
            linea);
      }

      canvas.drawCircle(Offset(x, y), diametro, circulo);
      canvas.drawCircle(Offset(x, y), diametro, circuloBorde); 
      textPainter.paint(canvas, offsetText);

      if (nodo.ultimo) {
        canvas.drawCircle(Offset(x, y), diametro, circuloBordeUltimo);
      }

      if (nodo.buscando) {
        canvas.drawCircle(Offset(x, y), diametro, circuloBordeBuscanodo);
      }

      pintar(canvas, x - ancho - ajusteIzq, y + ancho + 35, nodo.nodoIzquierdo);
      pintar(canvas, x + ancho + ajusteDer, y + ancho + 35, nodo.nodoDerecho);
    }
  }

  double ajustarDer(Nodo nodo, double ajusteDer, double ajuste) {
    if (nodo.nodoDerecho != null) {
      if (nodo.nodoDerecho!.nodoIzquierdo != null) {
        return ajusteDer =
            ajustarDerAux(nodo.nodoDerecho!.nodoIzquierdo!, ajusteDer);
      }
    }
    return ajusteDer = ajuste;
  }

  double ajustarDerAux(Nodo nodo, double ajustarDer) {
    double extra = ajustarDer;
    extra = diametro * 1.65;
    if (nodo.nodoIzquierdo != null) {
      extra = extra - 5 + ajustarDerAux(nodo.nodoIzquierdo!, extra);
    }
    if (nodo.nodoDerecho != null) {
      extra = extra - 15 + ajustarDerAux(nodo.nodoDerecho!, extra);
    }
    return extra;
  }

  double ajustarIzq(Nodo nodo, double ajusteIzq, double ajuste) {
    if (nodo.nodoIzquierdo != null) {
      if (nodo.nodoIzquierdo!.nodoDerecho != null) {
        return ajusteIzq =
            ajustarIzqAux(nodo.nodoIzquierdo!.nodoDerecho!, ajusteIzq);
      }
    }
    return ajusteIzq = ajuste;
  }

  double ajustarIzqAux(Nodo nodo, double ajustarIzq) {
    double extra = ajustarIzq;
    extra = diametro * 1.65;
    if (nodo.nodoDerecho != null) {
      extra = extra - 5 + ajustarIzqAux(nodo.nodoDerecho!, extra);
    }
    if (nodo.nodoIzquierdo != null) {
      extra = extra - 15 + ajustarIzqAux(nodo.nodoIzquierdo!, extra);
    }
    return extra;
  }


}
