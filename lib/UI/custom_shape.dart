import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
              
    Path path_0 = Path();
    path_0.moveTo(size.width*0.2811000,size.height*0.0844000);
    path_0.quadraticBezierTo(size.width*0.2539250,size.height*-0.0689000,size.width*-0.0025000,size.height*-0.0100000);
    path_0.lineTo(0,size.height*1.0100000);
    path_0.lineTo(size.width*0.2500000,size.height*0.9900000);
    path_0.lineTo(size.width*0.5000000,size.height);
    path_0.lineTo(size.width*1.0050000,size.height*1.0100000);
    path_0.lineTo(size.width*1.0025000,size.height*-0.0100000);
    path_0.quadraticBezierTo(size.width*0.7565250,size.height*-0.0984000,size.width*0.7250000,size.height*0.0900000);
    path_0.cubicTo(size.width*0.6525000,size.height*0.3175000,size.width*0.7752250,size.height*0.7501000,size.width*0.5000000,size.height*0.7128000);
    path_0.cubicTo(size.width*0.2242250,size.height*0.7550000,size.width*0.3527500,size.height*0.2928000,size.width*0.2811000,size.height*0.0844000);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShapeAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
              
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0078250,size.height*0.7715400);
    path_0.quadraticBezierTo(size.width*0.1656125,size.height*0.9824000,size.width*0.3093250,size.height*0.9867000);
    path_0.cubicTo(size.width*0.4780500,size.height*0.9894600,size.width*0.5810875,size.height*0.8098200,size.width*0.7581250,size.height*0.8154400);
    path_0.quadraticBezierTo(size.width*0.9238750,size.height*0.8267400,size.width*1.0337625,size.height*1.0189000);
    path_0.lineTo(size.width*0.9984250,size.height*-0.0008762);
    path_0.lineTo(size.width*-0.0015750,size.height*-0.0087154);
    path_0.lineTo(size.width*-0.0182000,size.height*0.8735200);
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShapeAppBar2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
              
         
    Path path_1 = Path();
    path_1.moveTo(size.width*-0.0737500,size.height*1.0762000);
    path_1.quadraticBezierTo(size.width*0.0812750,size.height*0.6664000,size.width*0.2612000,size.height*0.6951000);
    path_1.cubicTo(size.width*0.4168250,size.height*0.7082000,size.width*0.5972500,size.height*1.1975000,size.width*0.8821750,size.height*0.6848000);
    path_1.quadraticBezierTo(size.width*1.0132500,size.height*0.3931000,size.width*1.0502250,size.height*0.2761000);
    path_1.lineTo(size.width*1.0224500,size.height*-0.0228000);
    path_1.lineTo(size.width*-0.0025000,0);
    path_1.lineTo(size.width*-0.0737500,size.height*1.0762000);
    path_1.close();


    return path_1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ShapeAppBar3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
              
         
          
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0094875,size.height*0.8300600);
    path_0.quadraticBezierTo(size.width*0.1656125,size.height*0.9824000,size.width*0.3093250,size.height*0.9867000);
    path_0.cubicTo(size.width*0.4780500,size.height*0.9894600,size.width*0.5810875,size.height*0.8098200,size.width*0.7581250,size.height*0.8154400);
    path_0.quadraticBezierTo(size.width*0.9238750,size.height*0.8267400,size.width*1.0337625,size.height*1.0189000);
    path_0.lineTo(size.width*0.9984250,size.height*-0.0008762);
    path_0.lineTo(size.width*-0.0015750,size.height*-0.0087154);
    path_0.lineTo(size.width*-0.0182000,size.height*0.8735200);
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}