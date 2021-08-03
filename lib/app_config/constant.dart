

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


double indentationVertical(BuildContext context) => MediaQuery.of(context).size.height / 16 ;

Color shimmerBaseColor = Colors.grey;
Color shimmerHighlightColor = Colors.black;

// Text
var textH1 = GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 8, 
                            letterSpacing: .5),); 

//Padding
  padding1(context) => ResponseiveW.isMobile(context)? 8 : 13; 


     

// // Icon
//AppBar
var iconBagsNo = Image(image: AssetImage("assets/shopping_bags_no.png"));             
var iconBags = Image(image: AssetImage("assets/shopping_bags.png")); 
var ixonBack = Icon(Icons.arrow_back);
var backgroundColored = const Color(0xEDD9BF);

var likeNo = Image(image: AssetImage("assets/like_no.png"));             
var like = Image(image: AssetImage("assets/like.png"));            

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


