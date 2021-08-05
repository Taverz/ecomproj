
// import 'dart:math';

// import 'package:flutter/material.dart';


// class AnimationStaggred1 extends  InheritedWidget
//  {

//  final Widget child;

 

//   const AnimationStaggred1.staggered({
//     Key? key,
//       required this.child,
//   }): super(key: key, child: child);
  

//   static List<Widget> staggredAnim({
//     required List<Widget> childrenL,
//     required Widget Function(Widget, int) childAnimationBuilder,
//     }
//   ) => childrenL
//           .asMap()
//           .map((index, widget) {
//             return MapEntry(
//               index,
//               AnimationStaggred1.staggered(
//                 child:childAnimationBuilder(
//                 widget, 
//                 index)
//                )
//             );
//           })
//           .values
//           .toList();

//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) {
//    return false;
//   }



// }

// //1
// class SlideAnimation extends StatelessWidget {

//   final Widget child;
//   final Duration delay;
//   final Duration duration;
//   final int position;


//   SlideAnimation({
//     required this.child,
//     required this.duration,
//     required this.delay,
//     required this.position
//   });

//   @override
//   Widget build(BuildContext context) {
    
//   }

// }
// //2
// class FadeAnimation extends StatelessWidget {
  
//   final Widget child;
//   final Duration delay;
//   final Duration duration;
//   final int position;
  
  
//   FadeAnimation({
//     required this.child,
//     required this.duration,
//     required this.delay,
//     required this.position
//   });

//   @override
//   Widget build(BuildContext context) {
    
//   }

// }


// //TODO: Bloc from animation 
// typedef BuilderN = Widget Function(
//     BuildContext context, AnimationController? animationController);

// class AnimationConfigBuild extends StatelessWidget    {

  
//   final Widget child;
//   final Duration delay;
//   final Duration duration;
//   final int position;

//   final BuilderN builder;

//   AnimationConfigBuild({
//     required this.child,
//     required this.duration,
//     required this.delay,
//     required this.position,
//     required this.builder
//   });
 


//   @override
//   Widget build(BuildContext context) {

//     AnimationController _animationController = AnimationController(duration: duration, vsync: this);
// //     import 'dart:async';
// //     import 'package:flutter/widgets.dart';
//     Timer _timer = Timer(delay, () => _animationController.forward());

//     return AnimatedBuilder(
//       builder:_buildAnimation ,
//       animation: _animationController,
//     );
//   }

//   Widget _buildAnimation(BuildContext context,AnimationController contol) {
//     return builder(context, contol);
//   }



// }




