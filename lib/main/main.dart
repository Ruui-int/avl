import 'package:arbol_avl/UI/custom_appbar.dart';
import 'package:arbol_avl/UI/custom_buttom_bar.dart';
import 'package:arbol_avl/model/arbol_painter.dart';
import 'package:arbol_avl/model/avl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  late ArbolAvl arbol;
  late ArbolPainter painter;

  MainState() {
    arbol = ArbolAvl();
    painter = ArbolPainter(arbol);
  }

  void cambiarEstado() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Recopilar los nodos del árbol binario

    return Scaffold(
  backgroundColor: const Color.fromARGB(249, 247, 248, 250),
  body: Stack(
    children: [
      
      InteractiveViewer(
        boundaryMargin: EdgeInsets.all(double.infinity), // Margen adicional alrededor del contenido
        minScale: 0.1, // Escala mínima permitida
        maxScale: 2.0, // Escala máxima permitida
        child: Padding(
          padding: const EdgeInsets.only(top: 250),
          child: CustomPaint(
            painter: painter,
            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
          ),
        ),
      ),
      // Fondo de la página
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomAppBar(),
          SizedBox(height: 115),
          Expanded( // Para ocupar todo el espacio restante
            child: Container(
              alignment: Alignment.bottomCenter,
              child: BottomBar(arbol: arbol),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
      // InteractiveViewer superpuesto
      
    ],
  ),
);
  }
}
