

// ignore_for_file: prefer_typing_uninitialized_variables


import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';



import 'package:flutter/material.dart';

class Customfloatingbutton extends StatefulWidget {
   final buttonHeight;
    final buttonWidth;
    final buttonLabel;
   
    final ontap;
   const Customfloatingbutton({
   required this.buttonHeight,
   required this.buttonWidth,
   required this.buttonLabel,

    super.key,
    required this.ontap});

  @override
  State<Customfloatingbutton> createState() => _CustomfloatingbuttonState();
}

class _CustomfloatingbuttonState extends State<Customfloatingbutton> {
 

 
 
  @override
  Widget build(BuildContext context) {
   
    return  InkWell(
      onTap: widget.ontap,
      child: Mycontainer(
      
            height: widget.buttonHeight, //15
            width: widget.buttonWidth,  //12
            color: Colors.grey
            ,
             shadowcolor: Colors.black,
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
            
             child: Center(child: MyText(text: widget.buttonLabel,color: Colors.black,),),
           ),
    );
  }
 
}
