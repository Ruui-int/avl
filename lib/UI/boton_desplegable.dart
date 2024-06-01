import 'package:flutter/material.dart';

class BotonDesplegable extends StatefulWidget {
  const BotonDesplegable({Key? key}) : super(key: key);

  @override
  _BotonDesplegableState createState() => _BotonDesplegableState();
}

class _BotonDesplegableState extends State<BotonDesplegable> {
  bool masBotones = false;
  bool preOrder = false;
  bool inOrder = false;
  bool postOrder = false;

  void _resetFlags() {
    preOrder = false;
    inOrder = false;
    postOrder = false;
  }

  void _alterna(String button) {
    setState(() {
      if (button == 'preOrder') {
        if (preOrder) {
          preOrder = false;
        } else {
          _resetFlags();
          preOrder = true;
        }
      } else if (button == 'inOrder') {
        if (inOrder) {
          inOrder = false;
        } else {
          _resetFlags();
          inOrder = true;
        }
      } else if (button == 'postOrder') {
        if (postOrder) {
          postOrder = false;
        } else {
          _resetFlags();
          postOrder = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (preOrder)
          Positioned(
            top: 200,
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        if (inOrder)
          Positioned(
            top: 200,
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        if (postOrder)
          Positioned(
            top: 200,
            left: 50,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
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
                  color: const Color.fromARGB(255, 39, 46, 97), // Color del borde
                  width: 4.0, // Ancho del borde
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 52, 56, 102),
                      ),
                    ),
                    onPressed: () {
                      _alterna('preOrder');
                    },
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
                        const Color.fromARGB(0, 0, 0, 0),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: () {
                      _alterna('inOrder');
                    },
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
                        const Color.fromARGB(255, 52, 56, 102),
                      ),
                    ),
                    onPressed: () {
                      _alterna('postOrder');
                    },
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
