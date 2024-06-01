import 'package:flutter/material.dart';

class BotonDesplegable extends StatefulWidget {
  const BotonDesplegable({Key? key}) : super(key: key);

  @override
  _BotonDesplegableState createState() => _BotonDesplegableState();
}

class _BotonDesplegableState extends State<BotonDesplegable> {
  bool masBotones = false;

  @override
  Widget build(BuildContext context) {
    return Stack( // Cambiado de Column a Stack
      children: [
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 20, 24, 52),
                    Color.fromARGB(200, 38, 39, 66)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      // Acción del primer botón
                    },
                    child: const Text(
                      'Pre Order',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    onPressed: () {
                      // Acción del segundo botón
                    },
                    child: const Text(
                      'In Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      // Acción del tercer botón
                    },
                    child: const Text(
                      'Post Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
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
