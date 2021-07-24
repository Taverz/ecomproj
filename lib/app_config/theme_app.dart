
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
 // bool get isDarkMode => themeMode == ThemeMode.dark;
// ThemeMode themeMode = ThemeMode.dark;  // ThemeMode.system;
  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

  // primarySwatch: Colors.blue,
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
class MyThemes {

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,  
    primaryColor: Colors.black,  
    colorScheme: ColorScheme.dark(),
    backgroundColor: Colors.lime, 
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity:0.8 )  
  );


  static final lightTheme = ThemeData(
    primaryColor: Color(0xffF9BE7C),  
    dialogBackgroundColor:Color(0xffFDD5D6), 
    colorScheme: ColorScheme.light(),
    buttonColor: Color(0xbc6588e2),  
    backgroundColor:Color(0xffFFF9EB),   
    bottomAppBarColor: Color(0xffF9E5CD),
    iconTheme: IconThemeData(color: Color(0xff563928), opacity: 0.8 ) 
  );

  
}
