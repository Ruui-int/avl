import 'package:arbol_avl/UI/custom_shape.dart';
import 'package:arbol_avl/main/main.dart';
import 'package:arbol_avl/model/avl.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
 TextEditingController controller;
  late ArbolAvl arbol;
  double? clave;

  final GlobalKey<MainState> mainKey = GlobalKey<MainState>();

  BottomBar({super.key, required this.controller, required this.arbol});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 350,
      child: Stack(
        children: [
          ///// Este positioned contiene a los botones del NavBar
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Material(
              elevation: 30,
              shadowColor: const Color.fromARGB(255, 63, 75, 120),
              color: Colors.transparent,
              /* child: ClipPath(
                clipper: CustomShapeClipper(), */
              child: ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(
                  height: 75,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 5,
                      ),

                      ///Boton Para agregar
                      IconButton(
                        onPressed: () {
                          String claveString = controller.text;
                          int clave = int.tryParse(claveString) ?? 0;
                          if (claveString != "") { 
                          arbol.insertarNodo(clave);
                           } // Insertar nodo
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 238, 108, 122),
                          size: 30,
                        ),
                      ),
                      
                        ///Botón para eliminar
                      
                      IconButton(
                        onPressed: () {
                          String claveString = controller.text;
                          int clave = int.tryParse(claveString) ?? 0;
                          if (claveString != "") { 
                          arbol.eliminarNodo(clave);
                          controller.clear();
                           } 
                        },
                        icon: const Icon(
                          Icons.delete_outline_outlined,
                          color: Color.fromARGB(255, 33, 40, 89),
                          size: 30,
                        ),
                      ),

                      const SizedBox(
                        width: 140,
                      ),

                      //Botón para buscar
                      IconButton(
                        onPressed: () {
                          String claveString = controller.text;
                          int clave = int.tryParse(claveString) ?? 0;
                          if (claveString != "") {
                            arbol.buscar(clave);
                          }
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 33, 40, 89),
                          size: 30,
                        ),
                      ),

                      //botón para Reiniciar el arbol
                      IconButton(
                        onPressed: () {
                          arbol.resetArbol();
                        },
                        icon: const Icon(
                          Icons.restart_alt,
                          color: Color.fromARGB(255, 33, 40, 89),
                          size: 30,
                        ),
                      ),

                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
              /* ), */
            ),
          ),

          //Este postioned contiene un pequeño parche para estética

          Positioned(
            top: 74.5,
            left: 110,
            child: Container(
              height: 10,
              width: 130,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),

          ///// Este positioned contiene al input text

          Positioned(
            top: 6,
            left: 116,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 20),
              height: 60,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: SizedBox(
                width: 150,
                height: 150,
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: controller,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 33, 40, 89),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '...',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 33, 40, 89), fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
