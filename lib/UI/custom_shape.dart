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
              
     Path path_1 = Path();
    path_1.moveTo(size.width*-0.0196000,size.height*0.6544000);
    path_1.quadraticBezierTo(size.width*0.1254500,size.height*0.9799000,size.width*0.3053750,size.height*1.0086000);
    path_1.cubicTo(size.width*0.5293750,size.height*0.9989000,size.width*0.5687500,size.height*0.8327000,size.width*0.7553500,size.height*0.8330000);
    path_1.quadraticBezierTo(size.width*0.9591000,size.height*0.8833000,size.width*1.0217250,size.height*1.0798000);
    path_1.lineTo(size.width*1.0224500,size.height*-0.0228000);
    path_1.lineTo(size.width*-0.0025000,0);
    path_1.lineTo(size.width*-0.0196000,size.height*0.6544000);
    path_1.close();
    return path_1;
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
              
    Path path_1 = Path();
    path_1.moveTo(size.width*-0.0196000,size.height*0.6544000);
    path_1.quadraticBezierTo(size.width*0.1254500,size.height*0.9799000,size.width*0.3053750,size.height*1.0086000);
    path_1.cubicTo(size.width*0.5293750,size.height*0.9989000,size.width*0.5687500,size.height*0.8327000,size.width*0.7553500,size.height*0.8330000);
    path_1.quadraticBezierTo(size.width*0.9591000,size.height*0.8833000,size.width*1.0217250,size.height*1.0798000);
    path_1.lineTo(size.width*1.0224500,size.height*-0.0228000);
    path_1.lineTo(size.width*-0.0025000,0);
    path_1.lineTo(size.width*-0.0196000,size.height*0.6544000);
    path_1.close();

    return path_1;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
