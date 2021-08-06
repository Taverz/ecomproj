  
  
  
  
  // logoutS() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("API_Token", "");
  //   setState(() {
  //     build(context);
  //   });
  // }

 

//TODO() -User info - like, subscribe, name 
//TODO() -Logout button


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Container(
         child: Column(children: [
           SizedBox(height: 25,),
           CircleAvatar(
              radius: 32,
              child: Image.asset("assets/carousel2.png") ,),
           SizedBox(height: 12,),
           Text("Name Profile", style: GoogleFonts.abel(fontSize:18)),
           SizedBox(height: 25,),

         ],),
       ),
     ),
   );
  }

}