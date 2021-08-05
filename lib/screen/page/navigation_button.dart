

// TODO() - navigation button screen -- 4


import 'package:ecomproj/app_config/constant.dart';
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
      title: Text(""),
      icon: ImageIcon(
        
               AssetImage("assets/icon/like.png"),
                    // color: Color(0xFF3A5A98),
               ), 
    ),
    BottomNavigationBarItem(
        title: Text(""),
      icon:ImageIcon(
               AssetImage("assets/icon/like.png"),
                    // color: Color(0xFF3A5A98),
               ), 
    ),
    BottomNavigationBarItem(
        title: Text(""),
      icon: ImageIcon(
              AssetImage("assets/icon/like.png"),
                    // color: Colors,
               ), 
    ),
    BottomNavigationBarItem(
        title: Text(""),
      icon: ImageIcon(
             AssetImage("assets/icon/like.png"),
                    // color: Color(0xFF3A5A98),
               ), 
    ),
 ];

  static  List<Widget> _pages = <Widget>[
    //Home page
    HomePage(),
    //Buccmark page
    
     TrandScreen(),
    //Trand page
   BookmarkScreen(),
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
        backgroundColor: Colors.grey.shade500,
        elevation: 0,
        selectedItemColor: Colors.black,  
        unselectedIconTheme: IconThemeData(color: Colors.black,),
        items: [
           BottomNavigationBarItem(
      title: Text(""),
       icon: _selectedIndex ==0 ? Icon(Icons.home ,color: Colors.black,) :Icon(Icons.home_outlined ,color: Colors.black,) ,), 
  
    BottomNavigationBarItem(
        title: Text(""),
        icon: _selectedIndex ==1 ? Icon(Icons.star ,color: Colors.black,) :Icon(Icons.star_border ,color: Colors.black,) ,), 
    BottomNavigationBarItem(
        title: Text(""),
        icon: _selectedIndex ==2 ? Icon(Icons.favorite ,color: Colors.black,) :Icon(Icons.favorite_border ,color: Colors.black,) ,), 
    BottomNavigationBarItem(
        title: Text(""),
        icon: _selectedIndex ==3 ? Icon(Icons.person ,color: Colors.black,) :Icon(Icons.person_outline ,color: Colors.black,) ,), 
    
        ],
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




  