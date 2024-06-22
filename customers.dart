

import 'package:ammaz_enterprises/home/customers/add_invoice.dart';
import 'package:ammaz_enterprises/home/customers/custom_floating_button.dart';
import 'package:ammaz_enterprises/my_widgets/my_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



import '../../my_widgets/my_container.dart';
import 'new_customer.dart';


class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
   Widget? body=const Center(
            child: MyText(text: "Initial Customer Here",color: Colors.black,),
          );
             List<dynamic> _customers = [];
            final List<String> _salePerson=["1","2"];
            String initialsalePerson="1";

  var bankKey="";
  var customerNamecontroler=TextEditingController();
   var salePersonNamecontroler=TextEditingController();
  var customerOpeningBalance=TextEditingController();
   // select customer name
  var selectCustomerName="";
// sale person name
 var salePersonname="";
  // customer name show on app bar
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

   // fetch list of customers names from firebase
   void customersList(){
       FirebaseFirestore.instance.collection("SalePersonAgainstCustomer").
      get().then((value) {
        value.docs.forEach((element) {
          var cName=element.reference.id;
          _customers.add(cName);
          print("customer$_customers");
        },);
      },);
   }
 
  
 
  @override
  void initState() {
    // TODO: implement initState
    
   customersList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    final screenWidth=MediaQuery.sizeOf(context).width;
    final screenHeight=MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.green,
     appBar: AppBar(
      title: const MyText(text: "Customers",color: Colors.black,),
      shadowColor: Colors.black,
       bottomOpacity: 10,
          elevation: 5,
         
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
          hintText: "Select Customer",
            width: screenWidth/2,
            onSelected: (value) {
              setState(() {
                body=value;
                print("body call");
              });
            },
            dropdownMenuEntries:_customers.map((e) {
             /*  setState(() {
                selectCustomerName=e;
               salepersonNameagainstCustomer();
              }); */
              return DropdownMenuEntry(value:
           Column(children: [
            Mycontainer(
              color: Colors.white,
              aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
              aligmentColor2: Colors.white,
              height: screenHeight/15, width: screenWidth,child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyText(text: e,color: Colors.black,fontSize: 20,),
                  const MyText(text: "Balance: 10000000",color: Colors.black,fontSize: 20,),
                ],
              ),
              
            ),),
              Mycontainer(
              color: Colors.white,
              aligmentColor1: const Color.fromARGB(255, 2, 61, 4),
              aligmentColor2: Colors.white,
              height: screenHeight/17, width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Date",color: Colors.black,),)
                       ),
                       
                        Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Inv# No.",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Amount",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Status",color: Colors.black,),)
                       ),
                         Mycontainer(
                      height: screenHeight/17,
                       width: screenWidth/5,
                       color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:const Color.fromARGB(255, 2, 61, 4) ,
                       child: const Center(child: MyText(text: "Approved",color: Colors.black,),)
                       ),
                      
              ],),
            ),
            SizedBox(),
            
        salePersonname!=""?  StreamBuilder(
              stream: FirebaseFirestore.instance.collection("SalePersons").
              doc(salePersonname.toString()).collection(selectCustomerName).
              orderBy("Date",descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                if (snapshot.hasData) {
                  return ListView.builder(
                     scrollDirection: Axis.vertical,
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                    itemBuilder: (context, index){
                       var data = snapshot.data!.docs[index];
                        var docId = snapshot.data!.docs[index].id;
                        return    Row(
            children:[ Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Date"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["InvNo"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Amount"].toString(),color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Paid"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
               Mycontainer(
               color: Colors.white,
                       aligmentColor1: Colors.white,
                       aligmentColor2:Colors.white,
                       bordercolor: Colors.black,
                       borderwidth: 0.5,
              child: Center(child: MyText(text: data["Post"],color: Colors.black,)),
              height: screenHeight/20, width: screenWidth/5),
              ]
          );
                    }
                    
                    );
                } else {
                   return const Center(child: CircularProgressIndicator());
                }
              }
              ):const SizedBox()
          
       
           ],),
             label: e);
             
            }).toList(),
            ),
        ),
        const SizedBox(width: 10,),
        InkWell(
          onTap: () {
            setState(() {
              
            });
          },
          child: Container(
          
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 2, 61, 4),
               borderRadius: BorderRadius.circular(8)
            ),
            child: const Icon(Icons.refresh,color: Colors.blue,size: 35,))),
           const SizedBox(width: 10,),
      ],
     ),
     body: body,
     floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
       children: [
        Customfloatingbutton(
             ontap: (){
         
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewCustomer()));
                },
     
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "New Customer",
          
              ),
              SizedBox(height: screenHeight/35,),
               Customfloatingbutton(
             ontap: (){
         
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddInvoice()));
                },
     
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "Add invoice",
          
              ),

              /*  customFloatingButton(
                ontap: (){

                },
                dialogLabel: "Add Invoice",
          buttonHeight: screenHeight/15,
           buttonWidth: screenWidth/10,
            buttonLabel: "Add Invoice",
             dialogHeight: screenHeight/6,
              dialogWidth: screenWidth/3.5,
              column: Column(children: [
                customField(
                  prefixwidget: InkWell(
                    onTap: () async{
                        print("calllllllll");
                   DateTime? pickedDate = await showDatePicker(
    context: context, //context of current state
    initialDate: DateTime.now(),
    firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
    lastDate: DateTime(2101)
);

if(pickedDate != null ){
    print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
    print(formattedDate); //formatted date output using intl package =>  2021-03-16
}else{
    print("Date is not selected");
}
                    },
                    child: const Icon(Icons.calendar_month_sharp)),
                  height: screenHeight/20, width: screenWidth/3, hintText: "Tap on Calendar",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                SizedBox(height: screenHeight/35,),
                 customField(
                  prefixwidget: const Icon(Icons.format_list_numbered_outlined),
                  height: screenHeight/20, width: screenWidth/3, hintText: "Enter Invoice Number",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                 customField(
                  prefixwidget: const Icon(Icons.money),
                  height: screenHeight/20, width: screenWidth/3, hintText: "Enter Invoice Amount",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                 customField(
                  prefixwidget: const Icon(Icons.attach_money),
                  height: screenHeight/20, width: screenWidth/3, hintText: "Enter Invoice Profit",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),
                 SizedBox(height: screenHeight/35,),
                  customField(
                    prefixwidget: const Icon(Icons.percent),
                    height: screenHeight/20, width: screenWidth/3, hintText: "Tax Deduction",contentPaddingT: screenHeight/30,contentPaddingL: screenWidth/60),


              ],)
              ),
              */
       
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
                                                     x: 5,
                                                     y: 5,
                                   circularradius: 12,
                                   blurradius: 5,
            
             child: Center(child: MyText(text: buttonLabel,color: Colors.black,),),
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
