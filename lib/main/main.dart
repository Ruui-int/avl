import 'package:flutter/material.dart';
import 'package:arbol_avl/UI/custom_appbar.dart';
import 'package:arbol_avl/UI/custom_buttom_bar.dart';
import 'package:arbol_avl/model/arbol_painter.dart';
import 'package:arbol_avl/model/avl.dart';
import 'package:arbol_avl/UI/boton_desplegable.dart';

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
  bool masBotones = false;
  late ArbolAvl arbol;
  late ArbolPainter painter;
  final TextEditingController _controller = TextEditingController();

  MainState() {
    arbol = ArbolAvl(onUpdate: actualizarEstado);
    painter = ArbolPainter(arbol);
  }

  void actualizarEstado() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(249, 247, 248, 250),
      body: Stack(
        children: [
          InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(double.infinity),
            minScale: 0.1,
            maxScale: 2.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: CustomPaint(
                painter: painter,
                size: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomAppBar(),
              const SizedBox(height: 115),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: BottomBar(arbol: arbol, controller: _controller,),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),

          BotonDesplegable(),





        ],  
           
      ),
    );
  }
}
