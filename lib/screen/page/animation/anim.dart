




import 'dart:async';

import 'package:flutter/widgets.dart';


typedef BuilderN = Widget Function(BuildContext context, AnimationController? animationController);

class AninimExc extends StatefulWidget{
  final Duration duration;
  final Duration delay;
  final BuilderN builder;

  const AninimExc({
    Key? key,
    required this.duration,
    this.delay = Duration.zero,
    required this.builder,
  }) : super(key: key);

  @override
  _AnimationExcState createState() => _AnimationExcState();
}

class _AnimationExcState extends State<AninimExc> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Timer? _timer;

  @override
  void initState(){
    super.initState();

    _animationController = AnimationController(duration: widget.duration, vsync: this);

    if(AnimationLimite.shouldRunAnimatin(context) ?? true){
      _timer = Timer(widget.delay, () => _animationController!.forward());
    } else{
      _animationController!.value = 1.0;
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation : _animationController!,

    );
    
  }

  @override
  void dispose(){
    _timer?.cancel();
    _animationController!.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget? child){
      return widget.builder(context, _animationController);
  }

}



class AnimationConf extends StatelessWidget{
  final Duration? duration;
  final Duration? delay;
  final Widget Function(Animation<double>) animatedChildBuilder;

  const AnimationConf({
  Key? key,
    this.duration,
    this.delay,
    required this.animatedChildBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    

    
    final _position = animationConfiguration.position;
    final _duration = duration ?? animationConfiguration.duration;
    final _delay = delay ?? animationConfiguration.delay;
    final _columnCount = animationConfiguration.columnCount;


    
    
    return AninimExc(
      duration: _duration,
      delay: stagger(_position, _duration, _delay, _columnCount),
      builder: (context, animationController) =>
          animatedChildBuilder(animationController!),
    );
  }

  
  Duration stagger(
      int position, Duration duration, Duration? delay, int columnCount) {
    var delayInMilliseconds =
        (delay == null ? duration.inMilliseconds ~/ 6 : delay.inMilliseconds);

    int _computeStaggeredGridDuration() {
      return (position ~/ columnCount + position % columnCount) *
          delayInMilliseconds;
    }

    int _computeStaggeredListDuration() {
      return position * delayInMilliseconds;
    }

    return Duration(
        milliseconds: columnCount > 1
            ? _computeStaggeredGridDuration()
            : _computeStaggeredListDuration());
  }

}








