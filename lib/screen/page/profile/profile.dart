  
  
  
  
  // logoutS() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("API_Token", "");
  //   setState(() {
  //     build(context);
  //   });
  // }

 

//TODO() -User info - like, subscribe, name 
//TODO() -Logout button


import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {  //StatelessWidget{

    const Profile();
  @override
  _StateProfile createState() => _StateProfile();

}
  class _StateProfile extends State<Profile>{


  @override
  Widget build(BuildContext context) {
   return 
  //  Scaffold(
  //    body: 
     SafeArea(
       child: Container(
         child: Column(children: [
           SizedBox(height: 25,),
          //  CircleAvatar(
          //     radius: 80,
              // child: 
              Container(
                alignment: Alignment.center,
                child: ClipRRect(
                    child: Container(
                      width: 200,height:200, 
                     child: Image.asset( 'assets/carousel2.jpg',fit: BoxFit.cover   )),
                    borderRadius: BorderRadius.circular(300.0),                  
                ),
              ),
            // ),
              
           SizedBox(height: 12,),
           Text("Name User", style: GoogleFonts.abel(fontSize:34, fontWeight: FontWeight.bold)),
           SizedBox(height: 25,),

           Spacer(),
           GestureDetector(
             onTap: (){
               logoutS(context);
             },
             child: Container(
               height: ResponseiveW.isMobile(context) ? 45 : 70,
               width: ResponseiveW.isMobile(context) ? MediaQuery.of(context).size.width -(MediaQuery.of(context).size.width /7) : 400,               
               child: Center(child: Text("Log out", style: GoogleFonts.abel(fontSize:24,color: Colors.white),),),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black  ),
             ),
           ),
           SizedBox(height: 50,)

         ],),
       )
    //  ),
   );
  }

    
  logoutS(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginShared, "");
    setState(() {
      build(context);
    });
  }

}