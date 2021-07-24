
import 'package:ecomproj/screen/widget/indicator_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:google_fonts/google_fonts.dart';
//theme

class CaruselView  extends StatelessWidget {
   CaruselView ({ Key? key }) : super(key: key);

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