import 'package:arbol_avl/UI/custom_shape.dart';
import 'package:arbol_avl/model/avl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget {
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
          )),
        
        Opacity(
          opacity: 0.9,
          child: ClipPath(
            clipper: ShapeAppBar(),
            child: Container(
              height: height / 5,
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
              height: height / 3.9,
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
          left:20,
          right: 130,
          bottom: 10,
          child:  Image.asset(
            'assets/avl.png',
            fit: BoxFit.fill,
            width: 50,
            height: 200,
          )  
        ),
      ],
    );
  }
}
