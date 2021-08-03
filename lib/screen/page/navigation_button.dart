

// TODO() - navigation button screen -- 4


import 'package:ecomproj/screen/page/bookmar_n/bookmark.dart';
import 'package:ecomproj/screen/page/home_screen.dart';
import 'package:ecomproj/screen/page/other/profile.dart';
import 'package:ecomproj/screen/page/trand/trand_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';


class ButtonNavBar extends StatefulWidget {

  const ButtonNavBar({ Key? key }) : super(key: key);

  @override
  _ButtonNavBarState createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {

 int _selectedIndex = 0;

  static const List<BottomNavigationBarItem> buttonNavItem = [
    BottomNavigationBarItem(
      icon: Icon( Icons.ac_unit_rounded), 
    ),
    BottomNavigationBarItem(
      icon:Icon( Icons.ac_unit_rounded), 
    ),
    BottomNavigationBarItem(
      icon: Icon( Icons.ac_unit_rounded), 
    ),
    BottomNavigationBarItem(
      icon: Icon( Icons.ac_unit_rounded), 
    ),
 ];

  static  List<Widget> _pages = <Widget>[
    //Home page
    HomePage(),
    //Buccmark page
    BookmarkScreen(),
    //Trand page
    TrandScreen(),
    //Explore page
    Profile()
  ];

  // @override
  // void initState() {
  //   //  implement initState
  //   super.initState();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white10,
        // elevation: 0,
        mouseCursor: SystemMouseCursors.grab, //TDOD: When running on the web, you can customize the mouse cursor when it hovers over an item on the BottomNavigationBar:
        
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

        unselectedIconTheme: IconThemeData(
                                    color: Colors.deepOrangeAccent,
                                  ),
        unselectedItemColor: Colors.deepOrangeAccent,

        items: buttonNavItem,
         onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        currentIndex: _selectedIndex ,
        // onTap: _onItemTapped, 
      ),
      //Save state page Navigation button
      body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
      )
    );
  }


}




  