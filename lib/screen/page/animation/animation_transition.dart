
import 'dart:math';

import 'package:flutter/material.dart';


class AnimationTransition1  {


 AnimationTransition1.transitionBuilder(Widget widget, BuildContext context) {
        
        Navigator.of(context).push(
          
                      PageRouteBuilder(                    
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return widget;
                        },
    
                        transitionsBuilder: (
                            BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {

                              var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                              // return
                              // ScaleTransition( //Transform  //SlideTransition  //ScaleTransition
                              //   scale: animation,
                              //   child: child,
                              //   alignment:Alignment.center ,
                              //   );
                                 return
                              ScaleTransition( //Transform  //SlideTransition  //ScaleTransition
                                scale: animation,
                                child: child,
                                alignment:Alignment.center ,
                                );
                          // return Align(
                          //   child: FadeTransition(
                          //     opacity: animation,
                          //     child: child,
                          //   ),
                          // );
                        },
                      ),
         );


  }

 
  

}