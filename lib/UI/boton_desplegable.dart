import 'package:flutter/material.dart';
import 'package:arbol_avl/model/avl.dart';

class BotonDesplegable extends StatefulWidget {
  final ArbolAvl arbolAvl;

  const BotonDesplegable({Key? key, required this.arbolAvl}) : super(key: key);

  @override
  _BotonDesplegableState createState() => _BotonDesplegableState();
}

class _BotonDesplegableState extends State<BotonDesplegable> {
  bool masBotones = false;
  String preOrderRecorrido = '';
  String inOrderRecorrido = '';
  String postOrderRecorrido = '';
  bool preOrderVisible = false;
  bool inOrderVisible = false;
  bool postOrderVisible = false;

  void togglePreOrder() {
    setState(() {
      if (preOrderVisible) {
        preOrderVisible = false;
      } else {
        preOrderRecorrido = widget.arbolAvl.preOrder(widget.arbolAvl.raiz).join(', ');
        preOrderVisible = true;
        inOrderVisible = false;
        postOrderVisible = false;
      }
    });
  }

  void toggleInOrder() {
    setState(() {
      if (inOrderVisible) {
        inOrderVisible = false;
      } else {
        inOrderRecorrido = widget.arbolAvl.inOrder(widget.arbolAvl.raiz).join(', ');
        preOrderVisible = false;
        inOrderVisible = true;
        postOrderVisible = false;
      }
    });
  }

  void togglePostOrder() {
    setState(() {
      if (postOrderVisible) {
        postOrderVisible = false;
      } else {
        postOrderRecorrido = widget.arbolAvl.postOrder(widget.arbolAvl.raiz).join(', ');
        preOrderVisible = false;
        inOrderVisible = false;
        postOrderVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (preOrderVisible)
          Positioned(
            top: 175,
            left: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  preOrderVisible = false;
                });
              },
              child: SizedBox(
                width: 330,
                height: 100,
                child: Center(
                  child: Text(
                    'Pre Order: $preOrderRecorrido',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 56, 71, 98),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (inOrderVisible)
          Positioned(
            top: 175,
            left: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  inOrderVisible = false;
                });
              },
              child: SizedBox(
                width: 330,
                height: 100,
                child: Center(
                  child: Text(
                    'In Order: $inOrderRecorrido',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 56, 71, 98),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (postOrderVisible)
          Positioned(
            top: 175,
            left: 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  postOrderVisible = false;
                });
              },
              child: SizedBox(
                width: 330,
                height: 100,
                child: Center(
                  child: Text(
                    'Post Order: $postOrderRecorrido',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 56, 71, 98),
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        Positioned(
          top: 60,
          right: 40,
          child: GestureDetector(
            onTap: () {
              setState(() {
                masBotones = !masBotones;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: Icon(
                masBotones ? Icons.close : Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
        ),
        if (masBotones)
          Positioned(
            top: 110,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(141, 255, 255, 255),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(
                  color: const Color.fromARGB(255, 39, 46, 97),
                  width: 4.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 52, 56, 102)),
                    ),
                    onPressed: togglePreOrder,
                    child: const Text(
                      'Pre Order',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(0, 0, 0, 0)),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: toggleInOrder,
                    child: const Text(
                      'In Order',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 20, 24, 52),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 52, 56, 102)),
                    ),
                    onPressed: togglePostOrder,
                    child: const Text(
                      'Post Order',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
