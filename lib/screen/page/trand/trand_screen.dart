

//TODO() - трендовая одежда

import 'package:ecomproj/app_config/constant.dart';
import 'package:ecomproj/screen/page/bookmar_n/bookmark.dart';
import 'package:ecomproj/screen/page/other/bag.dart';
import 'package:ecomproj/screen/widget/appBar.dart';
import 'package:ecomproj/screen/widget/list_view_loaded.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrandScreen extends StatelessWidget {
  const TrandScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
         Container(
           padding: EdgeInsets.all(10),
            color: false ? Colors.transparent : Colors.brown.shade100,
            child: Row(children: [            
              Spacer(),
              IconButton(
                alignment: Alignment.centerLeft, 
                onPressed: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookmarkScreen() ),
                      );
                }, 
                icon: Icon(
              Icons.favorite,
              color: Colors.black,
            )
              ),
              IconButton(
                alignment: Alignment.centerLeft, 
                onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BagScreen() ),
                      );
                }, 
                icon: Icon(
              Icons.shopping_bag,
              color: Colors.black,
            )
              ),
          ],),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: [
              Text("Trand", 
              maxLines: 1,
              style: GoogleFonts.abel(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                  ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.tune,color: Colors.black,),  //filter_list //tune
                onPressed: () { 
                    _filterView();
              },),
          ],),
        ),
        Container( 
          padding: EdgeInsets.symmetric(horizontal: 15),  
          alignment: Alignment.centerLeft, 
          child: Text("7340 result found", 
                 maxLines: 1,
                style: GoogleFonts.abel(color: Colors.black54, fontSize: 14),),
        ),

        // GridView(gridDelegate: gridDelegate)
        ListViewLoaded(),


      ],),
      ),
      
    );
  }

  _filterView(){

  }

}