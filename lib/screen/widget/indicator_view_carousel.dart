import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _indexSegmentSelected = 1;
  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.only(top: 16),
                decoration: BoxDecoration(color: Colors.pink[50], borderRadius: BorderRadius.circular(16)),
                child: CustomPaint(
                  painter: PageTabIndicationPainter(pageController: _pageController),
                  child: Container(
                    width: 300,
                    height: 60,
                    child: Row(children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          changePage(0);
                        },
                        child: Text(
                          "One",
                          style: TextStyle(fontSize: 20, color: _indexSegmentSelected == 0 ? Colors.white : Colors.pink[400]),
                          textAlign: TextAlign.center,
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                changePage(1);
                              },
                              child:
                                  Text("Two", style: TextStyle(fontSize: 20, color: _indexSegmentSelected == 1 ? Colors.white : Colors.pink[400]), textAlign: TextAlign.center))),
                      Expanded(
                          child: GestureDetector(
                              onTap: () {
                                changePage(2);
                              },
                              child:
                                  Text("Three", style: TextStyle(fontSize: 20, color: _indexSegmentSelected == 2 ? Colors.white : Colors.pink[400]), textAlign: TextAlign.center))),
                    ]),
                  ),
                ),
              ),
              // Expanded(
              //     child: PageView(
              //   controller: _pageController,
              //   onPageChanged: (index) {
              //     changePage(index, animate: false);
              //   },
              //   children: [
              //     buildPage("Page One", index: 0),
              //     buildPage("Page Two", index: 1),
              //     buildPage("Page Three", index: 2),
              //   ],
              // ))
            ],
          ),
        ));
  }

  Widget buildPage(String title, {int index = 0}) {
    return AnimatedPadding(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.all(_indexSegmentSelected == index ? 0 : 28),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _indexSegmentSelected == index ? 1 : 0.3,
          child: Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.pink[200], borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          )),
    );
  }
  changePage(int index, {bool animate = true}) async {
    if (animate) {
      await _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
    }
    setState(() {
      _indexSegmentSelected = index;
    });
  }
}

class PageTabIndicationPainter extends CustomPainter {

  final PageController pageController;

  PageTabIndicationPainter({required this.pageController}) : super(repaint: pageController);

  @override
  void paint(Canvas canvas, Size size) {
    double pageOffset = 0;
    if (pageController.hasClients) {
      final position = pageController.position;
      print("${position.viewportDimension}");
      double fullExtent = (position.maxScrollExtent - position.minScrollExtent + position.viewportDimension);
      pageOffset = position.extentBefore / fullExtent;
    }


    Paint painterIndicator = Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(pageOffset * size.width ,0, (size.width / 3), size.height), Radius.circular(16)), painterIndicator);
    canvas.translate(size.width * pageOffset , 0.0);
  }

  @override
  bool shouldRepaint(PageTabIndicationPainter oldDelegate) => true;
}