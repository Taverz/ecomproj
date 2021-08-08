

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


double indentationVertical(BuildContext context) => MediaQuery.of(context).size.height / 16 ;

Color shimmerBaseColor = Colors.grey;
Color shimmerHighlightColor = Colors.grey.shade100;

const String loginShared = "Login";

// Text
// var textH1 = GoogleFonts.lato(
//                           textStyle: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 8, 
//                             letterSpacing: .5),); 

//Padding
  // padding1(context) => ResponseiveW.isMobile(context)? 8 : 13; 


     

// // Icon
//AppBar
var iconBagsNo = Image(image: AssetImage("assets/icon/shopping_bags_no.png"));             
var iconBags = Image(image: AssetImage("assets/icon/shopping_bags.png")); 
var ixonBack = Icon(Icons.arrow_back);
var backgroundColored = Colors.amber ; //const Color(0xEDD9BF);

var likeNo = Image(image: AssetImage("assets/icon/like_no.png"));             
var like = Image(image: AssetImage("assets/icon/like.png"));          

var likeNavBar = Image(image: AssetImage("assets/icon/like_nav.png"));     
var filterLine = Image(image: AssetImage("assets/icon/filter_line.png")); 


//
var decorationButton_Small = BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black  );
var borederList = BoxDecoration(borderRadius: BorderRadius.circular(15)  );


//Image profile
// var profileImage = Image(image: AssetImage("assets/carousel2.jpg")); 

// var like = ImageIcon(
//                AssetImage("assets/icon/like.png"),
//                     color: Color(0xFF3A5A98),
//                );
// var likeNo = ImageIcon(
//                AssetImage("assets/icon/like_no.png"),
//                     color: Color(0xFF3A5A98),
//                );
// var iconNav3 = ImageIcon(
//                AssetImage("images/like_nav.png"),
//                     color: Color(0xFF3A5A98),
//                );                              

//   CaruselViewPage
double radius_CaruselView = 50; 
double aspectRatio_CaruselView = 16/9; 
// var styleBigTitle = GoogleFonts();


//SplashSPage
Color containerColor = const Color(0xFFd92e29);
Image splashImage = Image(image: AssetImage('assets/splash.jpg'));





// Type
const String topType = 'TOP';
const String excploreType = 'EXPLORE';
const String bookmarkType = 'BOOKMARK';
const String trandType = 'TRAND'; 


