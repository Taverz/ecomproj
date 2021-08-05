

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_config/constant.dart';
import 'package:ecomproj/data/moor_database.dart';
import 'package:ecomproj/screen/page/animation/animation_transition_staggred_list.dart';
import 'package:ecomproj/screen/page/animation/animation_transition.dart';
import 'package:ecomproj/screen/widget/carousel_slider_vew.dart';
import 'package:ecomproj/screen/widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatelessWidget {


  const HomePage({ Key? key }) : super(key: key);



  @override
  Widget build(BuildContext context) {
List<String> listW= ["cot", "cat", "dog", "pat"];

    return Scaffold(
     
      body: Container(
        child: Column(children: [
      
          // Shimmer.fromColors(
          //   period: Duration(milliseconds: 1200),
          //   child:
            // CarouselView(),                
          //   baseColor: shimmerBaseColor, 
          //   highlightColor: shimmerHighlightColor 
          // ),
      
          SizedBox(height: 16 ,),
          Row(children:[
            Container(height: 25, padding: EdgeInsets.only(left: 20), 
                    child: Text("Subtitle1", 
                          style: Theme.of(context).textTheme.subtitle1 ),),
          ResponseiveW.isMobile(context)?
                Spacer()
                : SizedBox(width: 40 ,),
          _showAll(context),
          ]),
          SizedBox(height:16 ,),
          _listView(context),
           //List horizontal
          // ListViewWidgets(),
          SizedBox(height: 16,),
          Row(children:[
            Container(padding: EdgeInsets.only(left: 20), 
                child: Text("Subtitle1", 
                      style: Theme.of(context).textTheme.subtitle1 ),),
            ResponseiveW.isMobile(context)?
                Spacer()
                : SizedBox(width: 40 ,),
             _showAll(context),
          ]),

            // Shimmer.fromColors(
          //   period: Duration(milliseconds: 1200),
          //   child:
                         
          //   baseColor: shimmerBaseColor, 
          //   highlightColor: shimmerHighlightColor 
          // ),
          _listView(context),
        
          // ListView
        ],),
      )
    );
  }


Widget _listView(BuildContext context){
  List<String> listW= ["cot", "cat", "dog", "pat"];
 return  ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                      color: Colors.green,
                      height: 70,
                      width: 60,
                  child: Column(children: [
                    Container(
                      color: Colors.green,
                      height: 70,
                      width: 60,
                      child: Stack(children: [
                      Container(child:Image.asset("assets/carousel3.jpg")),
                      IconButton(onPressed: (){
                        //TODO: click change icon
                      }, icon: Icon(Icons.favorite,color: Colors.black,)),
                    ],)),
                    SizedBox(height: 10,),
                    Container(child: Text("Title"),),
                     Container(child: Text("Title"),),
                     Row(children: [
                       Container(child: Text("Price\$"),),
                       Spacer(),
      
                     ],)
                      
                  ],),), 
            separatorBuilder: (context, inde) => SizedBox(width: 10,), 
            itemCount: listW.length
          );
        
}

Widget _showAll(BuildContext context){
  return
  GestureDetector(
    key: ValueKey("showAll"),
    child: Container( 
      padding: EdgeInsets.only(right: 10), 
      child: Text("Show All", style: GoogleFonts.abel(fontSize: 14, color: Colors.blue) ), //Theme.of(context).textTheme.subtitle1 
    ),
    onTap: (){
      transitionBuilder(Container(color:Colors.green), context);
    },
  );
}

}