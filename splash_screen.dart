
import 'dart:async';




import 'package:flutter/material.dart';

import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Home()));
     });
     super.initState();
     
  }
  Widget build(BuildContext context) {
   // double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 61, 4),
      body: Column(
        children: [
          SizedBox(height: screenHeight/5,),
          Center(
            child: CircleAvatar(
              foregroundImage: const AssetImage('assets/ammaz.png'),
              radius: screenHeight/5,
              backgroundColor:  const Color.fromARGB(255, 2, 61, 4),
              foregroundColor: Colors.transparent,
            ),
          ),
          SizedBox(height: screenHeight/15,),
          Text("Ammaz Enterprises",style: TextStyle(
            color: Colors.white,fontStyle: FontStyle.italic,
            fontSize: screenHeight/12
          ),)
        ],
      ),
    );
  }
}
