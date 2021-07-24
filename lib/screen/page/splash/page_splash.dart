
import 'dart:async';

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_config/routes.dart';
import 'package:flutter/material.dart';

typedef Appbuilder = Function(BuildContext context//, List<dynamic> data
);

class PageSplash extends StatefulWidget {
  //  final List<Future> futures;
    
  final Appbuilder builder;
  

  const PageSplash({Key? key,  required this.builder //required this.futures,
  }) : super(key: key);

  @override
  _PageSplashState createState() => _PageSplashState();
}


class _PageSplashState extends State<PageSplash> {
  //  late List _data ;

  // @override
  // void initState(){
  //   super.initState();
  //   final start = DateTime.now().millisecondsSinceEpoch;
  //   Future.wait(widget.futures).then((data) {
  //     final duration = DateTime.now().microsecondsSinceEpoch - start;
  //     debugPrint("splash Future  : $duration");
  //     setState((){
  //         _data = data;
  //     });
  //   });

  // }

  // @override
  // Widget build(BuildContext context){
  //   if(_data == null){
  //     return Container(color: containerColor , child: splashImage,);
  //   }
  //   return widget.builder(context, _data);
  // }
int intr = 0;

   @override
  void initState() {
    super.initState();
    // Создаём таймер, который должен будет переключить SplashScreen на HomeScreen через 2 секунды
    Timer(
        Duration(seconds: 3),
        // Для этого используется статический метод навигатора
        // Это очень похоже на передачу лямбда функции в качестве аргумента std::function в C++
            () {setState(() {
              intr = 1;
            }); } //widget.nextRoute
    );
  }


  // Формирование виджета
  @override
  Widget build(BuildContext context) {
    print("splash screen");
    // А вот это вёрстка виджета,
    // немного похоже на QML хотя явно не JSON структура
      if(intr == 0){
    return Scaffold(
      // backgroundColor: Colors.blue,
      body:
      Container(
        // height: double.infinity,
        // width: double.infinity,
        height:   MediaQuery.of(context).size.height,
        width:   MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/splash_screen.jpg"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Container(
            key: ValueKey("splashScreen_image"),
          color: Colors.red,)// Image(image: AssetImage("assets/splash_screen.jpg")) , 
      ),
    );
    }
    return widget.builder(context);

  }

}
