

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/material.dart';



class ButtonNow extends StatelessWidget {
  const ButtonNow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponseiveW.isMobile(context)? 10 : 30,
      width: ResponseiveW.isMobile(context)? 40 : 40,
      decoration: BoxDecoration(),
      color:Theme.of(context).bottomSheetTheme.backgroundColor,
      child: Text("Shop now", style:Theme.of(context).textTheme.bodyText1),
    );
  }
}