import 'package:arbol_avl/UI/custom_buttom_bar.dart';
import 'package:arbol_avl/model/arbol_painter.dart';
import 'package:arbol_avl/model/avl.dart';
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
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final TextEditingController _controller = TextEditingController();
  late ArbolAvl arbol;
  late ArbolPainter painter;

  _MainState() {
    arbol = ArbolAvl();
    painter = ArbolPainter(arbol);
  }

  @override
  Widget build(BuildContext context) {
    // Recopilar los nodos del árbol binario
    
    return Scaffold(
      
      body: InteractiveViewer(
        boundaryMargin:
        const EdgeInsets.all(100000), // Margen adicional alrededor del contenido
        minScale: 0.1, // Escala mínima permitida
        maxScale: 2.0, // Escala máxima permitida
        child: Padding(
          padding: EdgeInsets.only(top: 55),
          child: CustomPaint(
            painter: painter,
            size: Size(MediaQuery.of(context).size.width, 500),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Botón para agregar un nuevo nodo
          FloatingActionButton(
            onPressed: () {
              String clave = _controller.text;
              arbol.insertarNodo(clave); // Insertar nodo
              _controller.clear();
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 16),

          // Botón para eliminar un nodo por clave
          FloatingActionButton(
            onPressed: () {
              setState(() {
                arbol.imprimirInOrden();
                arbol.resetArbol();
              });
            },
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(height: 16),

          // Botón para eliminar un nodo por clave
          FloatingActionButton(
            onPressed: () {
              setState(() {
              String clave = _controller.text;
              arbol.eliminarNodo(clave);
              _controller.clear();                
              });
            },
            child: const Icon(Icons.delete),
          ),

          const SizedBox(height: 16),

          // Campo de texto para ingresar la clave
          SizedBox(
            width: 150,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ingresa una clave',
              ),
            ),
          ),
          const SizedBox(height: 50),
          Center(child: BottomBar()),
        ],
      ),
    );
  }
}
