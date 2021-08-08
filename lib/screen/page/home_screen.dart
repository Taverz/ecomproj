

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_config/constant.dart';
import 'package:ecomproj/bloc/bag.dart';
import 'package:ecomproj/data/moor_database.dart';
import 'package:ecomproj/screen/page/animation/animation_transition_staggred_list.dart';
import 'package:ecomproj/screen/page/animation/animation_transition.dart';
import 'package:ecomproj/screen/widget/carousel_slider_vew.dart';
import 'package:ecomproj/screen/widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatefulWidget {

 const HomePage({ Key? key }) : super(key: key);

@override
_StateHome  createState()=> _StateHome();
}
class _StateHome extends State<HomePage>{  


  


  @override
  Widget build(BuildContext context) {
List<String> listW= ["cot", "cat", "dog", "pat"];
 final dataW = Provider.of<BagCacheBlock>(context);
    return 
    // Scaffold(
     
    //   body: 
      Scaffold(
        body: 
        // SafeArea(
        //   left: false,
        //   top: false,
        //   right: false,
      
          // child: 
          Container(
            child: SingleChildScrollView(
              child: Column(children: [
                  
                // Shimmer.fromColors(
                //   period: Duration(milliseconds: 1200),
                //   child:
                  // CarouselView(),    
                  // Container(
                  //   // width: MediaQuery.of(context).size.width,
                  //   child:
                    dataW.loading ? 
                      _carouselShimmer() : 
                       Carousel(),
                    //  Carousel(),
                  // ),            
                //   baseColor: shimmerBaseColor, 
                //   highlightColor: shimmerHighlightColor 
                // ),
                  
                // SizedBox(height: 16 ,),
                Row(children:[
                  Container(height: 25, padding: EdgeInsets.only(left: 20), 
                          child: Text("Trand", style: GoogleFonts.abel(
                            fontSize: 24, 
                            fontWeight: FontWeight.w700,
                            ),)
                          ),
                ResponseiveW.isMobile(context)?
                      Spacer()
                      : SizedBox(width: 40 ,),
                _showAll(context),
                ]),
             SizedBox(height: 20,),
                 Container(
                  padding: EdgeInsets.only(left: 10),
                  height:200,
                  child:  _listView(context)
                ),
                SizedBox(height:16 ,),
                // _listView(context),
                 //List horizontal
                // ListViewWidgets(),
                SizedBox(height: 16,),
                Row(children:[
                  Container(padding: EdgeInsets.only(left: 20), 
                      child:  Text("Trand", style: GoogleFonts.abel(
                        fontSize: 24, 
                         fontWeight: FontWeight.w700,
                        ),)
                      ),
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
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height:200,
                  
                  child:  _listView(context)
                ),
              
                // ListView
              ],),
            ),
          ),
        // ),
      );
    // );
  }


Widget _carouselShimmer(){
  return 
      Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        child:
                    Carousel()   ,
        baseColor: shimmerBaseColor, 
        highlightColor: shimmerHighlightColor 
      );
}

Widget _listView(BuildContext context){
  final data = Provider.of<BagCacheBlock>(context);
  data.loaded();
  List<String> listW= ["cot", "cat", "dog", "pat"];
 
 return  ListView.separated(
          physics:BouncingScrollPhysics() ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => data.loading ? _listShimmer(context) : _listItem(context) ,

            separatorBuilder: (context, inde) => SizedBox(width: 10,), 
            itemCount: listW.length
          );
        
}

Widget _listShimmer(BuildContext context){
  return  Container(
            color: Colors.grey.shade300,
            width: 160,
            child:
              Shimmer.fromColors(
            period: Duration(milliseconds: 1200),
            // child:
                         
            baseColor: shimmerBaseColor, 
            highlightColor: shimmerHighlightColor, 
          // ),

                child: Column(children: [
                     Expanded(
                        child: Container(
                          padding:EdgeInsets.all(8),
                          color: Colors.transparent,
                          height: 120,
                          child: Stack(children: [
                          Container( 
                            color: Colors.red,
                            // child:Image.asset("assets/carousel3.jpg")
                          ),
                          Positioned(
                            top: 0,
                            right: 0,                        
                            child: 
                           IconButton(onPressed: (){                             
                      
                            }, icon: Icon(Icons.favorite_outline ,color: Colors.black,)),
                          ),
                          
                        ],)),
                      ),
                      SizedBox(height: 10,),
                     Container(
                        padding:EdgeInsets.only(left: 8),
                        alignment: Alignment.centerLeft,
                          // child: Text("Title",  maxLines: 1,),
                      ),
                     
                        SizedBox(height: 5,),
                       Container(
                        padding:EdgeInsets.only(left: 8),
                        alignment: Alignment.centerLeft,
                        height: 10,
                        width: 40,                      
                        // child: Text("Title",  maxLines: 1,),
                        ),
                        SizedBox(height: 5,),
                       Row(children: [
                         Container(
                           padding:EdgeInsets.only(left: 8),
                           alignment: Alignment.centerLeft,
                           height: 10,
                           width: 40,
                          //  child: Text("Price\$",  maxLines: 1,),
                          ),
                         Spacer(),
                          GestureDetector(
                            child: Container(
                              color: Colors.black, 
                              width: 40, 
                              height: 30,  
                                child: Center(
                                  child: Text("buy",  maxLines: 1,
                                  style: GoogleFonts.abel(fontSize:14, color:Colors.white), 
                                  )
                                )
                              )
                            ),
                          SizedBox(width: 5,),
                       ],),
                       SizedBox(height: 5,),
                        
                    ],),
              ),
        ); 
}

Widget _listItem(BuildContext context){
    return Container(
             decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), 
                color: Colors.grey.shade300 
            ),
           
            width: 160,
            // child:
            //   Shimmer.fromColors(
            // period: Duration(milliseconds: 1200),
            // // child:
                         
            // baseColor: shimmerBaseColor, 
            // highlightColor: shimmerHighlightColor, 
          // ),

                child: Column(children: [
                     Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)), 
                          child: Container(
                            padding:EdgeInsets.all(8),
                            color: Colors.transparent,
                            height: 120,
                            child: Stack(children: [
                            Container( 
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15), color: Colors.red  
                              ),                           
                              child:Image.asset("assets/carousel3.jpg", fit: BoxFit.cover, )
                            ),
                            Positioned(
                              top: 0,
                              right: 0,                        
                              child: 
                             IconButton(onPressed: (){
                                //TODO: click change icon
                                              
                              }, icon: Icon(Icons.favorite_outline ,color: Colors.black,)),
                            ),
                            
                          ],)),
                        ),
                      ),
                      SizedBox(height: 10,),
                     Container(
                        padding:EdgeInsets.only(left: 8),
                        alignment: Alignment.centerLeft,
                          child: Text("Title",  maxLines: 1,),
                      ),
                     
                        SizedBox(height: 5,),
                       Container(
                        padding:EdgeInsets.only(left: 8),
                        alignment: Alignment.centerLeft,
                        child: Text("Title",  maxLines: 1,),),
                        SizedBox(height: 5,),
                       Row(children: [
                         Container(
                           padding:EdgeInsets.only(left: 8),
                           alignment: Alignment.centerLeft,
                           child: Text("Price\$",  maxLines: 1,),),
                         Spacer(),
                          GestureDetector(
                            child: Container(
                              decoration: decorationButton_Small,
                              width: 40, 
                              height: 30,  
                                child: Center(
                                  child: Text("buy",  maxLines: 1,
                                  style: GoogleFonts.abel(fontSize:14, color:Colors.white), 
                                  )
                                )
                              )
                            ),
                          SizedBox(width: 5,),
                       ],),
                       SizedBox(height: 5,),
                        
                    ],),
              // ),
        ); 
}

Widget _showAll(BuildContext context){
  return
  GestureDetector(
    key: ValueKey("showAll"),
    child: Container( 
      padding: EdgeInsets.only(right: 10), 
      child: Text("Show All", style: GoogleFonts.abel(fontSize: 14, color: Colors.blue.shade900) ), //Theme.of(context).textTheme.subtitle1 
    ),
    onTap: (){
      transitionBuilder(Container(color:Colors.green), context);
    },
  );
}

}