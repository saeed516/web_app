

import 'package:flutter/material.dart';

import '../my_widgets/my_container.dart';
import '../my_widgets/my_text.dart';
import 'bank/bank.dart';
import 'customers/customers.dart';
import 'sale_persons/sale_person.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.green,
         // foregroundColor:Colors.white ,
          centerTitle: true,
          bottomOpacity: 10,
          elevation: 5,
          shadowColor: Colors.black,
            flexibleSpace: Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.bottomLeft,end: Alignment.bottomRight,
            colors:[Colors.grey.shade50,const Color.fromARGB(255, 2, 61, 4),])
          ),
        ), 
        title: const MyText(text: "Home",color: Colors.black,),
      ),
            body: Row(
              children: [
               Mycontainer(
                height: screenHeight,
                 width: screenWidth/4.5,
                 color: Colors.grey.shade700,
                  aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                  aligmentColor2: Colors.white,
                 child: Column(
                   children: [
                    //  SizedBox(height: screenHeight/50,),
                     CircleAvatar(
              
              foregroundImage: const AssetImage('assets/ammaz.png'),
              radius: screenWidth>800? screenHeight/6:screenWidth/8,
              backgroundColor:  Colors.transparent,
              foregroundColor: Colors.transparent,
            ),
            MyText(text: "Ammaz Enterprises",color: Colors.white,fontSize: screenWidth/55,fontWeight: FontWeight.w700,),
                    SizedBox(height: screenHeight/25,),
                    InkWell(
                      onTap: () {
                        
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const Banks()));
                      },
                      child: sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Banks")),
                     SizedBox(height: screenHeight/25,),
                    sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Suppliers"),
                     SizedBox(height: screenHeight/25,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const Customers()));
                      },
                      child: sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Customers")),
                     SizedBox(height: screenHeight/25,),
                    InkWell(
                      onTap:() {
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>const SalesPersons()));
                      },
                      child: sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Sale Persons")),
                     SizedBox(height: screenHeight/25,),
                    sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Expenses"),
                     SizedBox(height: screenHeight/25,),
                    sideBarButton(height: screenHeight/25, width: screenWidth/6, name: "Log Out"),
                    /*  Mycontainer(
                       shadowcolor: Colors.black,
                           x: 5,
                           y: 8,
                      circularradius: 12,
                       blurradius: 5,
                      height: screenHeight/25,
                       width: screenWidth/6,
                       color: Colors.white,
                       child: const Center(child: MyText(text: "Banks",color: Colors.black,),),
                       ), */
                   ],
                 ),
                 ),
                Expanded(
                //  flex: 2, // Body takes 2/3 of the screen
                  child:Container(
                
                     decoration: const BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.centerLeft,end: Alignment.centerRight,
            colors:[ Color.fromARGB(255, 2, 61, 4),Colors.white])
          ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                       // SizedBox(height: screenHeight/25,),
                        label(
                          height: screenHeight/5,
                           width: screenWidth/1.5,
                            name: "Banks",
                            imagePath: const AssetImage("assets/bank.jpg"),
                            textSize: screenWidth/30,
                            rightPadding: screenWidth/3.5,
                            radius: screenWidth>800?screenHeight/10:screenWidth/10),
                          SizedBox(height: screenHeight/2.4,),
                            label(
                          height: screenHeight/5,
                           width: screenWidth/1.5,
                            name: "Suppliers",
                            imagePath: const AssetImage("assets/supplier.png"),
                            textSize: screenWidth/30,
                            rightPadding: screenWidth/3.5,
                            radius: screenWidth>800?screenHeight/10:screenWidth/10),
                          SizedBox(height: screenHeight/2.4,),
                            label(
                          height: screenHeight/5,
                           width: screenWidth/1.5,
                            name: "Customers",
                            imagePath: const AssetImage("assets/customers.jpg"),
                            textSize: screenWidth/30,
                            rightPadding: screenWidth/3.5,
                            radius: screenWidth>800?screenHeight/10:screenWidth/10),
                          SizedBox(height: screenHeight/2.4,),
                            label(
                          height: screenHeight/5,
                           width: screenWidth/1.5,
                            name: "Sale Persons",
                            imagePath: const AssetImage("assets/sales.jpg"),
                            textSize: screenWidth/30,
                            rightPadding: screenWidth/3.5,
                            radius: screenWidth>800?screenHeight/10:screenWidth/10),
                          SizedBox(height: screenHeight/2.4,),
                            label(
                          height: screenHeight/5,
                           width: screenWidth/1.5,
                            name: "Expenses",
                            imagePath: const AssetImage("assets/expenses.jpg"),
                            textSize: screenWidth/30,
                            rightPadding: screenWidth/3.5,
                            radius: screenWidth>800?screenHeight/10:screenWidth/10),
                          SizedBox(height: screenHeight/2.4,), 
                     
                      ],),
                    ),
                  )
                ),
              ],
            ),
          );
  }
   Widget sideBarButton({required height,required width,required name}){
    return   Mycontainer(
                       shadowcolor: Colors.black,
                       bordercolor: Colors.white,
                        aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                  aligmentColor2: Colors.white,
                           x: 2,
                           y: 5,
                      circularradius: 5,
                       blurradius: 5,
                      height: height,        // screenHeight/25,
                       width:width,                // screenWidth/6,
                       color: Colors.white,
                       child:  Center(child: MyText(text: name,color: Colors.black,),),
                       );
  }
   Widget label({required height,required width,required name,required radius,
  required rightPadding,required textSize,required imagePath}){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Mycontainer(
                         shadowcolor: Colors.grey.shade900,
                         bordercolor: Colors.white,
                          aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
                  aligmentColor2: Colors.white,
                             x: 3,
                             y: 12,
                        circularradius: 12,
                         blurradius: 10,
                        height: height,        // screenHeight/25,
                         width:width,                // screenWidth/6,
                         color: Colors.grey.shade900,
                         child:  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                              
                             // Icon(Icons.home_filled,color: Colors.white,),
                              CircleAvatar(
                                         
                                         foregroundImage: imagePath,
                                         radius:radius ,
                                         backgroundColor:  Colors.grey.shade900
                                       ),
                               Padding(
                                 padding: EdgeInsets.only(right:rightPadding ),
                                 child: MyText(text: name,color: Colors.white,fontSize:textSize ,),
                               ),
                             ],
                           ),
                         ),
                         ),
    );
  }
}
