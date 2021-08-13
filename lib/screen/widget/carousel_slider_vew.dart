import 'dart:async';

import 'package:ecomproj/screen/page/other/bag.dart';
import 'package:ecomproj/screen/widget/indicator_view_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:google_fonts/google_fonts.dart';

//theme
//TODO: сделать анимацию постоянной прокрутки по кругу carousel slider

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<int> lisNt = [1, 2, 3, 4, 5];

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Car();
}

class Car extends State<Carousel> {
  final int activeindex = 0;

// final CarouselController _controller = CarouselController();
  // final PageController _pageController = PageController();
 final  int _currentPage = 0;

  // @override
  // void initState() {
  //   super.initState();

  //   Timer.periodic(Duration(seconds: 2), (Timer timer) {
  //     if (_currentPage < 2) {
  //       _currentPage++;
  //     } else {
  //       _currentPage = 0;
  //     }

  //     _pageController.animateToPage(
  //       _currentPage,
  //       duration: Duration(milliseconds: 300),
  //       curve: Curves.easeIn,
  //     );
  //   });
  //   // _pageController.animateToPage(
  //   //   page  ,
  //   //   duration: Duration(seconds: 1),
  //   //   curve: curve
  //   // )
  // }
//  bool _isPlaying = false;
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Container(
        // height: 300,
        // color: Colors.black,
        // width: MediaQuery.of(context).size.width,

        // child:
        _carousel();
    // _paheView(context)

    // );
  }

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
 
  ];


  bool _isPlaying = false;

  Widget _carousel() {
    return
        //  Stack(children:[
        Container(
      height: MediaQuery.of(context).size.height /
          3, // - (MediaQuery.of(context).size.height / 3 )  ,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        controller: _sliderController,
          unlimitedMode: true,
          slideBuilder: (index) {
            return _buildPage(context, index: index);
            // Container(
            //   alignment: Alignment.center,
            //   color: colors[index],
            //   child: Text(
            //     letters[index],
            //     style: TextStyle(fontSize: 200, color: Colors.white),
            //   ),
            // );
          },
          autoSliderTransitionTime: Duration(seconds: 1),
          slideTransform: ParallaxTransform(),
          // slideIndicator: CircularSlideIndicator(
          //   padding: EdgeInsets.only(bottom: 32),
          // ),
          itemCount: colors.length),
    );
    // Positioned(
    //   bottom: 15,
    //   left: 15,
    //   child: _buildIndicator(), //_indicator()
    // )
    // ]);
  }



  Widget _buildPage(BuildContext context, {int? index}) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius_CaruselView),
          bottomRight: Radius.circular(radius_CaruselView)),
      child: AspectRatio(
        aspectRatio: aspectRatio_CaruselView, //constant
        child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: Container(
                    child: Image.asset(
                  "assets/carousel3.jpg",
                  fit: BoxFit.cover,
                ))),
            Positioned(
              top: 40,
              right: 20,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isonButCcol,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_bag,
                      color: isonButCcol,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BagScreen()),
                      );
                    },
                  )
                ],
              ),
            ), //Button trash -icon

            Positioned(
                bottom: 30,
                right: 30,
                child: GestureDetector(
                  child: Container(
                    decoration: decorationButton_Small,
                    width: 80,
                    height: 35,
                    // color:isonButCcol,
                    child: Center(
                        child: Text(
                      'Shop now',
                      style: GoogleFonts.abel(color: Colors.white),
                    )),
                  ),
                )), //Button Shop now - Animation tapButton

            Positioned(
              top: 70,
              left: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Small text",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: textColor, fontSize: 18, letterSpacing: .5),
                      )),
                  SizedBox(height: 5),
                  // Divider(height: 5,),
                  Container(
                    height: 1.4,
                    width: 160,
                    color: textColor,
                    // child: Divider(color: textColor, height: 14,)
                  ),
                  SizedBox(height: 5),
                  Text("Big title",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: textColor, fontSize: 36, letterSpacing: .5),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Midle title",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: textColor, fontSize: 24, letterSpacing: .5),
                      )),
                ],
              ),
            ),          
          ],
        ),
      ),
    );
  }

  var isonButCcol = Colors.black;
  var textColor = Colors.white;

// }

// class CarouselView  extends StatelessWidget {
//    CarouselView ({ Key? key }) : super(key: key);

//   int _indexSegmentSelected = 1;
  // PageController _pageController = PageController(initialPage: 1);

  Widget _paheView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 300,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            // onPageChanged: _onPageChanged,
            // (index) {
            //   changePage(index, animate: true);
            // },
            itemBuilder: (ctx, i) => _buildPage(context, index: i),
            itemCount: 3,
            // children: [
            // _buildPage(context,  index: 0),
            // _buildPage(context,  index: 1),
            // _buildPage(context,  index: 2),
            // _buildPage(context,  index: 3),
            // ],
          ),
        ),
        //  Positioned(
        //   bottom: 15,
        //   left: 15,
        //   child: indicator()
        // )
      ]),
    );
  }

  // _onPageChanged(int index) {
  //   setState(() {
  //     _currentPage = index;
  //   });
  // }


  changePage(int index, {bool animate = true}) async {
    if (animate) {
      await _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.decelerate);
    }
    // setState(() {
    //   _indexSegmentSelected = index;
    // });
  }

// }

}

///////////////////////////
///
///
///
///

class PageIndicatorPainter extends CustomPainter {
  PageIndicatorPainter({
    required this.pageCount,
    required this.dotRadius,
    required this.dotOutlineThickness,
    required this.spacing,
    required this.scrollPosition,
    required Color dotFillColor,
    required Color dotOutlineColor,
    required Color indicatorColor,
  })  : dotFillPaint = Paint()..color = dotFillColor,
        dotOutlinePaint = Paint()..color = dotOutlineColor,
        indicatorPaint = Paint()..color = indicatorColor,
        page = scrollPosition.hasPixels && scrollPosition.hasViewportDimension
            ? scrollPosition.pixels / scrollPosition.viewportDimension
            : 0;

  final int pageCount;
  final double dotRadius;
  final double spacing;
  final double page;
  final ScrollPosition scrollPosition;
  final double dotOutlineThickness;
  final Paint dotFillPaint;
  final Paint dotOutlinePaint;
  final Paint indicatorPaint;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final double totalWidth =
        (pageCount * (2 * dotRadius)) + ((pageCount - 1) * spacing);

    _drawDots(canvas, center, totalWidth);
    _drawPageIndicator(canvas, center, totalWidth);
  }

  void _drawPageIndicator(Canvas canvas, Offset center, double totalWidth) {
    final double spaceBetweenDotCenters = (2 * dotRadius) + spacing;
    final double pageIndexToLeft = page.floor().toDouble();
    final double leftDotX = (center.dx - (totalWidth / 2)) +
        (pageIndexToLeft * spaceBetweenDotCenters);
    final double transitionPercent = page - pageIndexToLeft;

    final double laggingLeftPositionPercent =
        (transitionPercent - 0.3).clamp(0.0, 1.0) / 0.7;

    final double indicatorLeftX =
        leftDotX + (laggingLeftPositionPercent * spaceBetweenDotCenters);

    final double acceleratedRightPositionPercent =
        (transitionPercent / 0.5).clamp(0.0, 1.0);

    final double indicatorRightX = leftDotX +
        (acceleratedRightPositionPercent * spaceBetweenDotCenters) +
        (2 * dotRadius);

    canvas.drawRRect(
      RRect.fromLTRBR(
        indicatorLeftX,
        center.dy - dotRadius,
        indicatorRightX,
        center.dy + dotRadius,
        Radius.circular(dotRadius),
      ),
      indicatorPaint,
    );
  }

  void _drawDots(Canvas canvas, Offset center, double totalWidth) {
    Offset dotCenter = center.translate((-totalWidth / 2) + dotRadius, 0);

    for (int i = 0; i < pageCount; i++) {
      _drawDot(canvas, dotCenter);
      dotCenter = dotCenter.translate((2 * dotRadius) + spacing, 0);
    }
  }

  void _drawDot(Canvas canvas, Offset dotCenter) {
    canvas.drawCircle(dotCenter, dotRadius - dotOutlineThickness, dotFillPaint);

    Path outlinePath = Path()
      ..addOval(Rect.fromCircle(center: dotCenter, radius: dotRadius))
      ..addOval(Rect.fromCircle(
          center: dotCenter, radius: dotRadius - dotOutlineThickness))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(outlinePath, dotOutlinePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
