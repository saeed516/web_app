
import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  
  final double height;
  final double width;
  final String? imagePath;
  final double borderwidth;
  final Color bordercolor;
  final double circularradius;
  final Color? color;
  final Color shadowcolor;
  final double x;
  final double y;
  final double blurradius;
  final Widget? child;
  final AlignmentGeometry  begin;
  final AlignmentGeometry  end;
  final Color aligmentColor1;
  final Color aligmentColor2;
  const Mycontainer(
      {super.key,
      
      required this.height,
      required this.width,
      this.borderwidth = 0.0,
      this.bordercolor = Colors.transparent,
      this.circularradius = 0.0,
      this.shadowcolor = Colors.transparent,
      this.x = 0.0,
      this.y = 0.0,
      this.blurradius = 0.0,
      this.child,
      this.color = Colors.transparent,
      this.aligmentColor1=Colors.white,
      this.aligmentColor2=const Color.fromARGB(255, 2, 61, 4),
      this.begin= Alignment.bottomLeft,
      this.end= Alignment.bottomRight,
      this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(circularradius),
      splashColor: Colors.grey,
      
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: imagePath != null
                ? DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(imagePath!))
                : null,
            border: Border.all(width: borderwidth, color: bordercolor),
            color: color,
            borderRadius: BorderRadius.circular(circularradius),
            gradient:LinearGradient(
            begin: begin,end: end,
            colors:[aligmentColor1,aligmentColor2]) ,
            boxShadow: [
              BoxShadow(
                  offset: Offset(x, y),
                  color: shadowcolor,
                  blurRadius: blurradius)
            ]),
        child: child,
      ),
    );
  }
}


