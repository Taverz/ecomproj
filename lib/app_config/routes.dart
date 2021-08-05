
import 'package:ecomproj/screen/page/home_screen.dart';
import 'package:flutter/material.dart';


const pageMain = Navigator.defaultRouteName;

//                const pageLogin = 
// "/login";
               const homePage = 
"/homepage";
//                const ROUTE_SETTING = 
// '/setting';
//                const ROUTE_SETTING_THEME = 
// '/setting/theme';
//                const pageWelcome = 
// 'welcome';


///app routers
final Map<String, WidgetBuilder> routes = {
  // '/first': (context) => FirstHome(),
  //'/second': (context) => SecondHome(),
  homePage: (context) => HomePage(),
  // pageLogin: (context) => LoginNavigator(),
  // pagePlaying: (context) => PlayingPage(),
};


String getInitialRoute() {
    // bool login = user != null;
    // if (!login && !setting.skipWelcomePage) {
    //   return pageWelcome;
    // }
    return homePage;
  }




