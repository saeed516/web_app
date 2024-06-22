

import 'package:ammaz_enterprises/my_widgets/my_container.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddInvoice extends StatefulWidget {
  const AddInvoice({super.key});

  @override
  State<AddInvoice> createState() => _AddInvoiceState();
}

class _AddInvoiceState extends State<AddInvoice> {
  // date  controler
  var invoiceDate=TextEditingController();
  // inv number controler
  final invNumber=TextEditingController();
  // inv amount controler
  final invAmount=TextEditingController();
  // select customer name
  var selectCustomerName="";
// sale person name
 var salePersonname="";
  
 
  // customer list
   List customersName=[];
   // fetch list of customers names from firebase
   void customersList(){
       FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
      get().then((value) {
        value.docs.forEach((element) {
          var cName=element.reference.id;
          customersName.add(cName);
          print(customersName);
        },);
      },);
   }
   // fetch saleperson name for customer
   void salepersonNameagainstCustomer()async{
        DocumentSnapshot snapNameofSalePerson= await  FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
    doc(selectCustomerName).get();
    var spn=snapNameofSalePerson["SPN"];
    print(spn);
    setState(() {
      salePersonname=spn;
    });
   }
  
  // method to add invoice on firebase

  void uploadInvoice()async{
    
    try {
         
  await  FirebaseFirestore.instance.collection("SalePersons").doc(salePersonname).
    collection(selectCustomerName).doc(invNumber.text).set({
      "Date":invoiceDate.text,
      "InvNo":invNumber.text,
      "Amount":num.parse(invAmount.text),
      "Paid":"",
      "Post":"",
    });
    
    } catch (e) {
      print(e);
    }
 
  }
  @override
  void initState() {
    customersList();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
      // getting the size of the window
    final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const MyText(text: "Add Invoice",color: Colors.black,),
        flexibleSpace: Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.bottomLeft,end: Alignment.bottomRight,
            colors:[Colors.grey.shade50,Color.fromARGB(255, 2, 61, 4),])
          ),
        ), 
      ),
      body: Row(children: [
        Container(
          height:  screenHeight,
          width: screenWidth/2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/addinvoice.jpg")
              )
          ),
        ),
       
           Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
            begin: Alignment.topCenter,end: Alignment.bottomCenter,
            colors:[Colors.white,Colors.white])
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight/45),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:screenWidth/30 ),
                child: Mycontainer(
                  height:screenHeight/10
                  ,
                   width: screenWidth,
                    shadowcolor: Colors.grey.shade50,
                    bordercolor: Colors.black,
                    borderwidth: 2,
                     x: 5,
                     y: 5,
                    circularradius: 12,
                    blurradius: 50,
                   //  aligmentColor1: Colors.white,
                //  aligmentColor2: Colors.white,
                   color: Colors.black,
                   
                   child:  Center(
                    child: MyText(text: "Invoice Details",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight/20,),
                   ),
                   ),
              ),
              SizedBox(height: screenHeight/15),
                         Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: customField(
                height: screenHeight/15,
                 width: screenWidth,
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                 controler: invoiceDate,
                 readOnly: true,
                 onTapTextField: ()async{
                    print("calllllllll");
                   DateTime? pickedDate = await showDatePicker(
    context: context, //context of current state
    initialDate: DateTime.now(),
    firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101)
);

if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('dd-MM-yy').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
    invoiceDate.text=formattedDate;
}else{
    print("Date is not selected");
}
                 },
                  hintText: "Invoice Date",
                  prefixwidget: const Icon(Icons.calendar_month,color: Colors.blue,)
                  ),
                         ),
              SizedBox(height: screenHeight/35),
               Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: customField(
                height: screenHeight/15,
                 width: screenWidth,
                 controler: invNumber,
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  hintText: "Invoice Number",),
                         ),
                         SizedBox(height: screenHeight/35),
                         Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: Mycontainer(
                         height: screenHeight/13,
                         width: screenWidth/2,
                         color: Colors.grey,
                         bordercolor: Colors.black,
                         borderwidth: 0.5,
                         // aligmentColor1: Colors.white,
                 // aligmentColor2: Colors.white,
                         circularradius: 12,
                         child: DropdownMenu(
                         
                         hintText: "Select Customer",
                         inputDecorationTheme: const InputDecorationTheme(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          )
                         ),
                width: screenWidth/2,
               
                onSelected: (value) {
                  setState(() {
                    selectCustomerName=value;
                    print(selectCustomerName);
                  });
                  salepersonNameagainstCustomer();
                },
                dropdownMenuEntries:customersName.map((e) {
               
                  return DropdownMenuEntry(value: e, label: e);
                 
                }).toList(),
                ),
                       ),
                         ),
                       
                         Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        
                      });
                    },
                     child: const MyText(text: "Retrive Customers",color: Colors.blue,))
                ],
               ),
                         ),
               
               Padding(
               padding: EdgeInsets.symmetric(horizontal:screenWidth/20 ),
               child: customField(
                height: screenHeight/15,
                 width: screenWidth,
                 controler: invAmount,
                 contentPaddingT: screenHeight/30,
                 contentPaddingL: screenWidth/60,
                  hintText: "Invoice Amount",),
                         ),
                         SizedBox(height: screenHeight/10),
                         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mycontainer(
                  height:screenHeight/15 , 
                  width:screenWidth/10 ,
                 // aligmentColor1: Colors.white,
                 // aligmentColor2: Colors.white,
                  color: Colors.black,
                  circularradius: screenWidth/10,
                  child: const Center(
                    child: MyText(text: "Cancel",color: Colors.black,),
                  ),
                  ),
                  InkWell(
                    onTap: () {
                      uploadInvoice();
                      Navigator.of(context).pop();
                    },
                    child: Mycontainer(
                    height:screenHeight/15 , 
                    width:screenWidth/10 ,
                                     //  aligmentColor1: Colors.white,
                                     // aligmentColor2: Colors.white,
                    color: Colors.black,
                     circularradius: screenWidth/10,
                    child: const Center(
                      child: MyText(text: "Upload",color: Colors.black,),
                    ),
                    ),
                  )
              ],
                         )
              
                ],
              ),
            ))
      ],),
    );
  }
  Widget customField({var controler,var onTapTextField, bool readOnly=false,var prefixwidget,required height,required width,required hintText,var contentPaddingT=0.0,var contentPaddingL=0.0}){
    return  Mycontainer(
                                 height: height,      //screenHeight/12
                                                     width: width,   // screenWidth/3
                                                     shadowcolor: Colors.grey.shade50,
                                                     x: 0,
                                                     y: 1,
                                   circularradius: 12,
                                   blurradius: 100,
                                   
                                   child: TextField(
                                    onTap:onTapTextField ,
                                    readOnly: readOnly,
                                     controller: controler,
                                                 showCursor: false,
                                     decoration: InputDecoration(
                                                  prefixIcon:prefixwidget ,   
                                                   contentPadding: EdgeInsets.only(top:contentPaddingT,left: contentPaddingL ),
                                                  hintText:hintText ,
                                                  fillColor: Colors.transparent,
                                                  filled: true,
                                                  enabledBorder:OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(color: Colors.black,width: 0.5)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(12),
                                                    borderSide: const BorderSide(color: Colors.green,width: 1.5)
                                                  )
                                     ),
                                     
                                   ),
                                 );
  }
}