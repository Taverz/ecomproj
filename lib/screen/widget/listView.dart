
//TODO()- add grid-view list

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/bloc/database_local_bloc.dart';
import 'package:ecomproj/screen/widget/button_new.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class ListViewWidgets extends StatelessWidget{

    // Axis scrollDirect;
    
  // ListViewWidgets({required this.scrollDirect });

  bool grid;

  ListViewWidgets( this.grid , );

  final _controller = ScrollController();

      @override
      Widget build(BuildContext context) {
        
        return Expanded(
          child: grid ? _streamGrid() : _streamList() ,
        );
        

      }




_streamList(){
  StreamBuilder<List<dynamic>> _buildTaskList2(BuildContext context) {
    final database = Provider.of<DatabaseLocalBloc>(context);
    
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
      
  Widget _listView({List<dynamic>? dataSnapshot}){
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        period: Duration(milliseconds: 1200),
        baseColor: Colors.grey[350]?? Color.fromARGB(0,0, 0, 0) ,
        highlightColor:  Colors.grey[200] ?? Color.fromARGB(0,0, 0, 0) ,
        child: SmartRefresher(
              controller: _refreshController,
              //  onRefresh: () async {
              //   await model.refresh();
              //   listKey.currentState.refresh(model.list.length);
              // },
              // onLoading: () async {
              //   await model.loadMore();
              //   listKey.currentState.refresh(model.list.length);
              // },
          child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 8, height: 8),//Divider(),
                  physics: BouncingScrollPhysics(),
                  itemCount: dataSnapshot!.length,
                  scrollDirection: Axis.horizontal ,
                  itemBuilder: (context, item){
                      return _itemList(context, item, dataSnapshot );
                  }
          ),
        ),
      ),
    );
  }

  Widget _itemList(BuildContext context, int index, List data){
    return Column(
            children: [
                Container(
                  height: ResponseiveW.isMobile(context)? 50: 90,
                  width:ResponseiveW.isMobile(context)? 50: 90 ,
                  child: Stack(children: [
                      Positioned(child: Image(image:AssetImage("assets/carousel1.jpg"))), //Image Background
                      Positioned(child: like ,) ,//Container + Icon like
                      Positioned(child: ButtonNow(),) , //Button New
                  ],),
                ),
                SizedBox(height: 7,),
                Container( padding: EdgeInsets.only(right: padding1(context)), child: Text("Subscribe", style: Theme.of(context).textTheme.subtitle2 ),),
                Container( padding: EdgeInsets.only(right: padding1(context)), child: Text("Price \$", style: Theme.of(context).textTheme.subtitle1 ),),
            ]


          );

  }
//////////////
///
/// Grid


  _streamGrid(){
    StreamBuilder<List<dynamic>> _buildTaskList2(BuildContext context) {
    final database = Provider.of<DatabaseLocalBloc>(context);
    return StreamBuilder(
        // stream: database.getAllwTasks(),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.hasData && snapshot.data!=null) {                  
                  return 
                    _gridView(context, dataSnapshot:snapshot.data);
                }
                              //this will load first
                return CircularProgressIndicator();

        },
      );
    }
  }

   Widget _gridView(BuildContext context, {List<dynamic>? dataSnapshot}){
         final database = Provider.of<DatabaseLocalBloc>(context);
     return GridView.builder(
            physics: BouncingScrollPhysics(),
            controller: _controller,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent( // SliverGridDelegateWithFixedCrossAxisCount
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: dataSnapshot!.length,
            itemBuilder: (BuildContext context, index) {
               return _itemList(context, index, dataSnapshot);
            });
   }


  _typeList(String type,  DatabaseLocalBloc dat){
    switch (type) {
      case topType:
        
        break;
      case excploreType:
        
        break;
      case bookmarkType:
        
        break;
      case trandType:
        
        break;
      // default:
        
    }
  }

}