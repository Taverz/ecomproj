
import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {
   
  String title;
  List<IconButton> listIconBut;
  
  MyAppBar({required this.title, required this.listIconBut });


  @override
  Widget build(BuildContext context) {
    return 
    SliverAppBar(
      title: Text(title, style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: listIconBut,
    );
  }
}


class MyCustomAppBar extends StatelessWidget {
   
  String title;
  List<IconButton> listIconBut;
  MaterialColor backround;
  bool transparent;
  
  MyCustomAppBar({required this.title, required this.listIconBut, required this.transparent,  this.backround = Colors.red });


  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: transparent ? Colors.transparent : Theme.of(context).appBarTheme.color  ,
      child: Row(children: [
        IconButton(alignment: Alignment.centerLeft, 
              onPressed: (){
                
              }, 
              icon: Icon(Icons.arrow_back)),
        Container(alignment: Alignment.center,
              child: Text(title, style: Theme.of(context).textTheme.headline4,),)
      ],),
    );
  }
}