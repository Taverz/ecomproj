

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_config/constant.dart';
import 'package:ecomproj/screen/page/animation/animation_staggred_list.dart';
import 'package:ecomproj/screen/page/animation/animation_transition.dart';
import 'package:ecomproj/screen/widget/carusel_vew.dart';
import 'package:ecomproj/screen/widget/listView.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class HomePage extends StatelessWidget {


  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height:   MediaQuery.of(context).size.height,
        // width:   MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor ,),
        child: Column(children: [
          Shimmer.fromColors(child: CaruselView()
          , baseColor: shimmerBaseColor, highlightColor: shimmerHighlightColor ),
          SizedBox(height: 16 ,),
          Row(children:[
            Container(padding: EdgeInsets.only(left: 20), 
                    child: Text("Subtitle1", 
                          style: Theme.of(context).textTheme.subtitle1 ),),
          ResponseiveW.isMobile(context)?
                Spacer()
                : SizedBox(width: 40 ,),
            _showAll(context),
            ]),
          SizedBox(height:16 ,),
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
        
          // ListView
        ],),
      )
    );
  }


Widget _showAll(BuildContext context){
  return
  GestureDetector(
    key: ValueKey("showAll"),
    child: Container( 
      padding: EdgeInsets.only(right: 10), 
      child: Text("Show All", style: Theme.of(context).textTheme.subtitle1 ),
    ),
    onTap: (){
      AnimationTransition1.transitionBuilder(Container(), context);
    },
  );
}

}