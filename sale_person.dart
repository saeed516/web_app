

import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class SalesPersons extends StatefulWidget {
  const SalesPersons({super.key});

  @override
  State<SalesPersons> createState() => _SalesPersonsState();
}

class _SalesPersonsState extends State<SalesPersons> {
    Widget? body=const Center(
            child: MyText(text: "Initial SalePerson Here",color: Colors.black,),
          );
            List<dynamic> _salespersons = [];
           // DatabaseReference databaseReference=FirebaseDatabase.instance.ref("Salespersons");

  var bankKey="";
   var personName=TextEditingController();
  

  // get sales persons names
   void getSalePerson(){
    FirebaseFirestore.instance.collection("SalePersons").get().then((value) {
      value.docs.forEach((element) {
        var name=element.reference.id;
        _salespersons.add(name);
        print(_salespersons);
      });
    });
   }
   @override
  void initState() {
    // TODO: implement initState
    getSalePerson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(

     appBar: AppBar(
      title: const MyText(text: "SalePerson",color: Colors.black,),
      shadowColor: Colors.black,
       bottomOpacity: 10,
          elevation: 5,
          flexibleSpace: Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.bottomLeft,end: Alignment.bottomRight,
            colors:[Colors.grey.shade50,Colors.grey,])
          ),
        ), 
         
      actions: [
        Mycontainer(
          height: screenHeight,
          width: screenWidth/2,
          color: Colors.grey,
           
          child: DropdownMenu(
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              )
            ),
          hintText: "Select SalePerson",
            width: screenWidth/2,
            onSelected: (value) {
              setState(() {
                body=value;
                print("body call");
              });
            },
            dropdownMenuEntries:_salespersons.map((e) {
              setState(() {
                bankKey=e;
              });
              return DropdownMenuEntry(value:
           Column(children: [
            Mycontainer(height: screenHeight/20, width: screenWidth,child: Center(
              child: MyText(text: e,color: Colors.black,),
            ),),
           Table(
            border: TableBorder.all(width: 1,color: Colors.black),
            children: const [TableRow(
              children: [
                MyText(text: "Date",color: Colors.black,),
                MyText(text: "Invoice No.",color: Colors.black,),
                MyText(text: "Invoice Amount",color: Colors.black,),
                MyText(text: "Tax Dedaction",color: Colors.black,),
                MyText(text: "Invoice Profit",color: Colors.black,),
                MyText(text: "Balance",color: Colors.black,),
              ]
            )],
           )
           ],),
             label: e);
             
            }).toList(),
            ),
        )
      ],
     ),
     body: body,
     floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
       children: [
        customFloatingButton(
             ontap: ()async{
           await FirebaseFirestore.instance.collection("SalePersons").doc(personName.text.toLowerCase()).set({"Name":personName.text}).then((value) {
              Navigator.canPop(context);
            });
                },
          dialogLabel: "New SalePerson",
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "New SalePerson",
             dialogHeight: screenHeight/3.5,
              dialogWidth: screenWidth/3.5,
              column: Column(children: [
                customField(
                  controler: personName,
                   prefixwidget: const Icon(Icons.abc),
                  height: screenHeight/15, width: screenWidth/3, hintText: "Enter Name",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                SizedBox(height: screenHeight/35,),
                

              ],)
              ),
            
              
             
       
       ],
     ),
    );
  }
  Widget customFloatingButton({
    required buttonHeight,
    required buttonWidth,
    required buttonLabel,
    required dialogHeight,
    required dialogWidth,
    required dialogLabel,
    Widget? column,
    required ontap
    
    
   
    
    
    }){
    return  InkWell(
      onTap: () {
         showDialog(
              context: context,
              builder: (BuildContext context) {
                return  Padding(
                  padding:  EdgeInsets.symmetric(vertical: dialogHeight,horizontal: dialogWidth),//4,3.5
                  child: AlertDialog(
                    shadowColor: Colors.black,
                      title:  MyText(text: dialogLabel,color: Colors.black,),		 // To display the title it is optional
                      content:column, // Message which will be pop up on the screen
                                        // Action widget which will provide the user to acknowledge the choice
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop();}, child: const MyText(text: "Cancel",color: Colors.black,)),
                           TextButton(onPressed: ontap, child: const MyText(text: "Add",color: Colors.blue,))
                      ],
                      ),
                );
              },
              
            );
      },
      child: Mycontainer(
      
            height: buttonHeight, //15
            width: buttonWidth,  //12
            color: Colors.grey
            ,
             shadowcolor: Colors.black,
             bordercolor: Colors.white,
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
            
             child: Center(child: MyText(text: buttonLabel,color: const Color.fromARGB(255, 0, 0, 0),),),
           ),
    );
  }
  Widget customField({var controler, var prefixwidget,required height,required width,required hintText,var contentPaddingT=0.0,var contentPaddingL=0.0}){
    return  Mycontainer(
                                 height: height,      //screenHeight/12
                                                     width: width,   // screenWidth/3
                                                     shadowcolor: Colors.black,
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
                                   child: TextField(
                                    
                                     controller: controler,
                                                 showCursor: false,
                                     decoration: InputDecoration(
                                                  prefixIcon:prefixwidget ,   
                                                   contentPadding: EdgeInsets.only(top:contentPaddingT,left: contentPaddingL ),
                                                  hintText:hintText ,
                                                  fillColor: Colors.grey.shade300,
                                                  filled: true,
                                                  enabledBorder:OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: BorderSide.none
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(color: Colors.blue,width: 1.5)
                                                  )
                                     ),
                                     
                                   ),
                                 );
  }
}