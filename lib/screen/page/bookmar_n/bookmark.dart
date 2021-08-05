

// TODO() -list like

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/bloc/database_local_bloc.dart';
import 'package:ecomproj/screen/widget/appBar.dart';
import 'package:ecomproj/screen/widget/listView.dart';
import 'package:ecomproj/screen/widget/list_view_loaded.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var providerLiked = Provider.of<>(context);

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
                  Container(child: Text("Bookmarks" ,style: GoogleFonts.abel(fontSize:24),)),       
                  Spacer(),
                
                  IconButton(
                    icon: Icon(Icons.tune,color: Colors.black,),  //filter_list //tune
                    onPressed: () { 
                        // _filterView();
                  },),
                  ],),
                ),

            ListViewLoaded(),
            // _listView(context);
            // ListView.separated(
            //   itemBuilder: (context, index){
            //       return Container() ;
            //   } , 
            // separatorBuilder: (context, intdex) => SizedBox() , 
            // itemCount: 12),

          ],),
      ),
      
    );
  }


  // Widget _listView(BuildContext context){
  //   final provDB = Provider.of<DatabaseLocalBloc>(context);
  //   DatabaseLocalBloc
  //   return ListViewWidgets(true,provDB );
  // }

}