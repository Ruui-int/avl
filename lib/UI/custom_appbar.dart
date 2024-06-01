import 'package:arbol_avl/UI/custom_shape.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _masBotones = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned(
          top: 10,
          left: 30,
          right: 0,
          child: Image.asset(
            'assets/avl.png',
            fit: BoxFit.fill,
            width: 50,
            height: 50,
          ),
        ),
        Opacity(
          opacity: 0.9,
          child: ClipPath(
            clipper: ShapeAppBar(),
            child: Container(
              height: height / 5.1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 20, 24, 52),
                    Color.fromARGB(250, 38, 39, 66)
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: ShapeAppBar2(),
            child: Container(
              height: height / 4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 20, 24, 52),
                    Color.fromARGB(250, 38, 39, 66)
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.25,
          child: ClipPath(
            clipper: ShapeAppBar3(),
            child: Container(
              height: height / 4.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 20, 24, 52),
                    Color.fromARGB(250, 38, 39, 66)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          right: 130,
          bottom: 10,
          child: Image.asset(
            'assets/avl.png',
            fit: BoxFit.fill,
            width: 50,
            height: 200,
          ),
        ),
        
        if (_masBotones)
          Positioned(
            top: 70,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción del primer botón
                  },
                  child: const Text('Pre Order'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción del segundo botón
                  },
                  child: const Text('In Order'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Acción del tercer botón
                  },
                  child: const Text('Post Order'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}


