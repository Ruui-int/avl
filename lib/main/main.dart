import 'package:arbol_avl/logica/Controller.dart';
import 'package:arbol_avl/logica/nodoWidget.dart';
import 'package:flutter/material.dart';
//import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PruebaCirculos(),
    );
  }
}

class PruebaCirculos extends StatefulWidget {
    @override
    _PruebaCirculosState createState() => _PruebaCirculosState();
}

class _PruebaCirculosState extends State<PruebaCirculos> {
    TextEditingController _controller = TextEditingController();
    ArbolAvl arbol = ArbolAvl(); // Instancia de ArbolBinario

    @override
    Widget build(BuildContext context) {
        // Recopilar los nodos del árbol binario
        List<Widget> nodosVisuales = [];
        
        if (arbol.raiz != null) {
            _recolectarNodos(arbol.raiz!, nodosVisuales);
        }

        return Scaffold(
            body: Stack(
                children: nodosVisuales,
            ),
            floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                    // Botón para agregar un nuevo nodo
                    FloatingActionButton(
                        onPressed: () {
                            String clave = _controller.text;
                            double screenWidth = MediaQuery.of(context).size.width;
                            arbol.insertar(clave, screenWidth);  // Insertar nodo
                            _controller.clear();
                            setState(() {});
                        },
                        child: const Icon(Icons.add),
                    ),

                    const SizedBox(height: 16),

                    // Botón para eliminar un nodo por clave
                    FloatingActionButton(
                        onPressed: () {
                          print("Aqui");
                            String clave = _controller.text;
                            /* arbol.eliminar(clave); */ // Eliminar nodo
                            _controller.clear();
                            setState(() {});
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
                ],
            ),
        );
    }

   
    void _recolectarNodos(Nodo nodo, List<Widget> nodosVisuales) {
        nodosVisuales.add(nodo);
        if (nodo.nodoIzquierdo != null) {
            _recolectarNodos(nodo.nodoIzquierdo!, nodosVisuales);
        }
        if (nodo.nodoDerecho != null) {
            _recolectarNodos(nodo.nodoDerecho!, nodosVisuales);
        }
    }
}