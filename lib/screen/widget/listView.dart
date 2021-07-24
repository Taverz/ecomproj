


import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_database_local.dart';
import 'package:ecomproj/screen/widget/button_new.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewWidgets extends StatelessWidget{

    // Axis scrollDirect;
    
  // ListViewWidgets({required this.scrollDirect });

  final _controller = ScrollController();

      @override
      Widget build(BuildContext context) {
        
        return Expanded(
          child: _streamList(),
        );
        

      }




_streamList(){
  StreamBuilder<List<dynamic>> _buildTaskList2(BuildContext context) {
    final database = Provider.of<AppDatabaseLocal>(context);
    return StreamBuilder(
      // stream: database.getAllwTasks(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData && snapshot.data!=null) {                  
                return 
                  _listView(dataSnapshot:snapshot.data);
              }
                            //this will load first
              return CircularProgressIndicator();

      },
    );
  }
}

  Widget _listView({List<dynamic>? dataSnapshot}){
    return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: 8, height: 8),//Divider(),
            physics: BouncingScrollPhysics(),
            itemCount: dataSnapshot!.length,
            scrollDirection: Axis.horizontal ,
            itemBuilder: (context, item){
                return _itemList(context, item);
            }
    );
  }

  Widget _itemList(BuildContext context, int index){
    return Column(
                  children: [
                      Container(
                        height: ResponseiveW.isMobile(context)? 50: 90,
                        width:ResponseiveW.isMobile(context)? 50: 90 ,
                        child: Stack(children: [
                            Positioned(child: Image(image:AssetImage("assets/carousel1.jpg"))), //Image Background
                            Positioned(child: like ,) ,//Container + Icon like
                            Positioned(child: ButtonNew(),) , //Button New
                        ],),
                      ),
                      SizedBox(height: 7,),
                      Container( padding: EdgeInsets.only(right: padding1(context)), child: Text("Subscribe", style: Theme.of(context).textTheme.subtitle2 ),),
                      Container( padding: EdgeInsets.only(right: padding1(context)), child: Text("Price \$", style: Theme.of(context).textTheme.subtitle1 ),),
                  ]


                );

  }



}