

// TODO() -список товаров котоые собираются купить
// TODO() -Цена и кнопка покупки


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
            Container(
           padding: EdgeInsets.all(15),
            color: true ? Colors.transparent : Colors.brown.shade100,
            child: Row(children: [  
              IconButton(
                icon: Icon(Icons.arrow_back ,color: Colors.black,),  //filter_list //tune
                onPressed: () { 
                  Navigator.pop(context);
              },),
              Spacer(),
              Container(child: Text("Bag" ,style: GoogleFonts.abel(fontSize:24),)),    
              Spacer(),
             
              IconButton(
                icon: Icon(Icons.tune,color: Colors.black,),  //filter_list //tune
                onPressed: () { 
                    // _filterView();
              },),
          ],),
        ),
         // ListView(),
         Spacer(),
          Container(child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Row(children: [
                Text("Blabla", style: GoogleFonts.abel(fontSize:18, color:Colors.black54 ),),
                 Spacer(),
                Text("Blabla", style: GoogleFonts.abel(fontSize:18, color:Colors.black) )
              ],),
            ),
            Container( width: MediaQuery.of(context).size.width  -  (MediaQuery.of(context).size.width / 7)  , child: Divider(height: 12, color: Colors.black,)),
             Padding(
               padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
               child: Row(children: [
                Text("Blabla", style: GoogleFonts.abel(fontSize:18, color:Colors.black54 ),),
                Spacer(),
                Text("Blabla", style: GoogleFonts.abel(fontSize:18, color:Colors.black) )
                         ],),
             ),

            Container(
              height: 50,
             width: MediaQuery.of(context).size.width  -  (MediaQuery.of(context).size.width / 7)  ,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black  ),
              child: Center(  child: Text("Continue",style:  GoogleFonts.abel(fontSize:18, color:Colors.white) ,),),
            ),
            SizedBox(height: 25,)
          ],),)
        
        ],),
      ),
      
    );
  }
}