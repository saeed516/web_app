
import 'package:flutter/material.dart';

import '../../my_widgets/my_container.dart';
import '../../my_widgets/my_text.dart';


class Banks extends StatefulWidget {
  const Banks({super.key});

  @override
  State<Banks> createState() => _BanksState();
}

class _BanksState extends State<Banks> {
 
 
 
  Widget? body=const Center(
            child: MyText(text: "Initial bank Here",color: Colors.black,),
          );
 
  List _banks = ["bank1","bank2"];
  final List balance = [];
  var bankKey="";
  final bankName=TextEditingController();
  final openingBalance=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
   // getBank();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    // getting the size of the window
    final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(

     appBar: AppBar(
      title: MyText(text: "Banks",color: Colors.black,),
      shadowColor: Colors.black,
       bottomOpacity: 10,
          elevation: 5,
         
      actions: [
        Mycontainer(
          height: screenHeight,
          width: screenWidth/2,
          color: Colors.grey,
           
          child: DropdownMenu(
          hintText: "Select Bank",
            width: screenWidth/2,
            onSelected: (value) {
              setState(() {
                body=value;
                print("body call");
              });
            },
            dropdownMenuEntries:_banks.map((e) {
              setState(() {
                bankKey=e;
              });
              return DropdownMenuEntry(value:
            Center(child: MyText(text: e,color: Colors.black,),),
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
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "Opening Bank",
             dialogHeight: screenHeight/4,
              dialogWidth: screenWidth/3.5,
              column: Column(children: [
                customField(height: screenHeight/12, width: screenWidth/3, hintText: "Enter Bank Name"),
                SizedBox(height: screenHeight/24,),
                 customField(height: screenHeight/12, width: screenWidth/3, hintText: "Opening Balance"),

              ],)
              ),
              SizedBox(height: screenHeight/35,),
               customFloatingButton(
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "InWard Amount",
             dialogHeight: screenHeight/10,
              dialogWidth: screenWidth/3.5,
              column: Column(children: [
                customField(height: screenHeight/20, width: screenWidth/3, hintText: "Date",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                SizedBox(height: screenHeight/35,),
                 customField(height: screenHeight/20, width: screenWidth/3, hintText: "Chq Number",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                 customField(height: screenHeight/20, width: screenWidth/3, hintText: "BankType",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                 customField(height: screenHeight/20, width: screenWidth/3, hintText: "Customer Name",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                  customField(height: screenHeight/20, width: screenWidth/3, hintText: "Amount",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),


              ],)
              ),
              SizedBox(height: screenHeight/35,),
               customFloatingButton(
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "OutWard Amount",
             dialogHeight: screenHeight/4,
              dialogWidth: screenWidth/3.5,
              column: Column(children: [
                customField(height: screenHeight/12, width: screenWidth/3, hintText: "Enter Bank Name"),
                SizedBox(height: screenHeight/24,),
                 customField(height: screenHeight/12, width: screenWidth/3, hintText: "Opening Balance"),

              ],)
              )
       
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
    Widget? column,
    
    
   
    
    
    }){
    return  Mycontainer(

          height: buttonHeight, //15
          width: buttonWidth,  //12
          
           child: FloatingActionButton(
           backgroundColor: Colors.grey,
            child:  Center(child: MyText(text: buttonLabel,color: Colors.black,),),
            onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return  Padding(
                  padding:  EdgeInsets.symmetric(vertical: dialogHeight,horizontal: dialogWidth),//4,3.5
                  child: AlertDialog(
                    shadowColor: Colors.black,
                      title: const MyText(text: "Add Bank",color: Colors.black,),		 // To display the title it is optional
                      content:column, // Message which will be pop up on the screen
                                        // Action widget which will provide the user to acknowledge the choice
                        actions: [
                          TextButton(onPressed: (){}, child: const MyText(text: "Cancel",color: Colors.black,)),
                           TextButton(onPressed: (){}, child: const MyText(text: "Add",color: Colors.blue,))
                      ],
                      ),
                );
              },
              
            );
           
           }),
         );
  }
  Widget customField({required height,required width,required hintText,var contentPaddingT=0.0,var contentPaddingL=0.0}){
    return  Mycontainer(
                                 height: height,      //screenHeight/12
                                                     width: width,   // screenWidth/3
                                                     shadowcolor: Colors.black,
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
                                   child: TextField(
                                     controller: openingBalance,
                                                 showCursor: false,
                                     decoration: InputDecoration(
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