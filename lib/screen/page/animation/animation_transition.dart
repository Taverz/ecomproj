
import 'dart:math';

import 'package:flutter/material.dart';


transitionBuilder(Widget widget, BuildContext context) {
        
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
                              //TODO: Curve animation
                              var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                final tween = Tween(begin: begin, end: end);
                                final offsetAnimation = animation.drive(tween);

                                  final _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Interval(0.0, 1.0, curve: Curves.easeInOut),
                                      ),
                                    );

                                    var opac = Opacity(
                                      opacity: _opacityAnimation.value,
                                      child: child,
                                    );


                              // return
                              // ScaleTransition( //Transform  //SlideTransition  //ScaleTransition
                              //   scale: animation,
                              //   child: child,
                              //   alignment:Alignment.center ,
                              //   );
                                 return
                              SlideTransition(//ScaleTransition( //Transform  //SlideTransition  //ScaleTransition
                                // scale: animation,
                                child: Opacity(
                                      opacity: _opacityAnimation.value,
                                      child: child,
                                    ),
                                // alignment:Alignment.center, 
                                position: offsetAnimation ,
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

 
  

