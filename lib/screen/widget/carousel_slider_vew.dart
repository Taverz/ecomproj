
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomproj/screen/widget/indicator_view_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecomproj/app_config/Lib_Pref.dart';
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

   List<int> lisNt = [1, 2, 3, 4, 5];

class Carousel extends StatefulWidget{

  
  @override
  State<StatefulWidget> createState() => Car();


}
class Car extends State<Carousel> {

final CarouselController _controller = CarouselController();
final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Stack(
            children:[  
              Container(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height ,
                child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                    ),
                    items: lisNt
                      .map((item) => Container(
                            child: Center(child: Text(item.toString())),
                            color: Colors.green,
                          ))
                      .toList(),
                  ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                child: indicator()
              )
            ]
           
          ));
  }

  Widget indicator(){
     final double _dotRadius = 10.0;
    return AnimatedBuilder(
                animation:  _pageController,
                builder: (context, snapshot) {
                  return Container(
                    height: _dotRadius * 2.0,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: PageIndicatorPainter(
                        pageCount: 4,
                        dotRadius: _dotRadius,
                        dotOutlineThickness: _dotRadius / 10,
                        spacing: _dotRadius * 2.5,
                        scrollPosition: _pageController.position,
                        dotFillColor: const Color(0x0F000000),
                        dotOutlineColor: const Color(0x20000000),
                        indicatorColor: const Color(0xFF444444),
                      ),
                    ),
                  );
        });
  }



}


class CarouselView  extends StatelessWidget {
   CarouselView ({ Key? key }) : super(key: key);

  int _indexSegmentSelected = 1;
  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height / 3,
                    child: PageView(
                                  controller: _pageController,
                                  onPageChanged: (index) {
                    changePage(index, animate: true);
                                  },
                                  children: [
                                  _buildPage(context,  index: 0),
                                  _buildPage(context,  index: 1),
                                  _buildPage(context,  index: 2),
                                  _buildPage(context,  index: 3),
                                  ],
                                ),
                  ));
  }

  _buildPage(BuildContext context, {int? index} ) {
      return Container(
     alignment: Alignment.topCenter, //TODO()
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor ,
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(radius_CaruselView)  , bottomRight:Radius.circular(radius_CaruselView) ) , 
        ) ,
          child :ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(radius_CaruselView)  , bottomRight:Radius.circular(radius_CaruselView) ) , 
            child: AspectRatio(
              aspectRatio: aspectRatio_CaruselView, //constant
              child: Stack(children: [
              
              Positioned(child: CustomPaint(
                    painter: PageTabIndicationPainter(pageController: _pageController),
                    )
                  ),

                Positioned(child: IconButton(icon:likeNo , onPressed: (){ },) ), //Button like -icon
                Positioned(child: IconButton(icon:iconBagsNo , onPressed: (){ },) ), //Button trash -icon
                Positioned(child: GestureDetector(child: Container(),)), //Button Shop now - Animation tapButton
                Positioned(child: Text("Small text", style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.blue,fontSize: 8, letterSpacing: .5),) )),
                Container(height: 5, width: 50, child: Divider(height: 4,)), //Simle line from design
                Positioned(child: Text("Big title", style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.blue,fontSize: 20, letterSpacing: .5),) )) , //Title
                Positioned(child: Text("Midle title", style: GoogleFonts.lato(
                          textStyle: TextStyle(color: Colors.blue, fontSize: 14, letterSpacing: .5),) )),
                
              ],),
            ),
            )
    );
  }

  changePage(int index, {bool animate = true}) async {
    if (animate) {
      await _pageController.animateToPage(index, 
              duration: Duration(milliseconds: 300), 
              curve: Curves.decelerate);
    }
    // setState(() {
    //   _indexSegmentSelected = index;
    // });
  }

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