
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

getPlatform() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  String os = Platform.operatingSystem; //in your code
  print('Running on -os- ${os}');

  if (Platform.isIOS) {
    // iOS
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print('Running on -ios- ${iosInfo.utsname.machine}');
    return iosInfo.utsname.machine;
  } else if (Platform.isWindows) {
    // Windows
    return "Windows";
  }else if(Platform.isAndroid){
    // Android
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on -a- ${androidInfo.model}');
    return androidInfo.model;
  }else if(Platform.isLinux){
    return "Linux";
  }else if(Platform.isMacOS){
    return "MacOS";
  }else if(kIsWeb){  //Web
    return "Web";
  }

}