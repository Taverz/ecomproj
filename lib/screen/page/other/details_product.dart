
// TODO() - фото продукта 
// TODO() - ценник  на фотке кликабельный 
// TODO() - подробнее о продукте :описание
// TODO() - цвета
// TODO() - похожие- в колекции, сочитания

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Details extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child:Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: ,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.only(bottomLeft:Radius.circular(radius_CaruselView)  , bottomRight:Radius.circular(radius_CaruselView) ) ,
                child: Container(color: Colors.blue,), 
              // ),
              // child: Image(image: ,),
            ),
            SizedBox(height: 20,),
            Row(children: [
              Container(
                child: Text("Name clothes", style: GoogleFonts.abel(fontSize: 18),),
              ), 
              Spacer(),
              Container(
                child: Text("Price\$ ",style: GoogleFonts.abel(fontSize: 14)),
              ),
            ],),
              Row(children: [],),
             Container(
              height: 50,
             width: MediaQuery.of(context).size.width  -  (MediaQuery.of(context).size.width / 7)  ,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black  ),
              child: Center(  child: Text("+ Add bag",style:  GoogleFonts.abel(fontSize:18, color:Colors.white) ,),),
            ),
        ],)
      )
    );
  }

}