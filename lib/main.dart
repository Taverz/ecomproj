import 'package:ecomproj/app_config/routes.dart';
import 'package:ecomproj/app_config/theme_app.dart';
import 'package:ecomproj/app_database_local.dart';
import 'package:ecomproj/screen/page/splash/page_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: implementation_imports
import 'package:provider/src/change_notifier_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {


  //  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  // WidgetsFlutterBinding.ensureInitialized();
  // neteaseRepository = NeteaseRepository();
  // api.debugPrint = debugPrint;
  // Logger.root.onRecord.listen((record) {
  //   debugPrint('${record.time} ${record.level.name} ${record.loggerName}: ${record.message}');
  // });
  WidgetsFlutterBinding.ensureInitialized();

  

 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) =>
        runApp(
               MultiProvider(
      
      providers: [
        Provider<AppDatabaseLocal>(    //dispose: (context, db) => db.close(),
            create: (context) => AppDatabaseLocal() ), // (_)
      ],
      child:
       ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
            title: 'E-Commerce BLoC + Provider',
            initialRoute: getInitialRoute(),
            routes: routes,
          );
        }
      ),
    )
          
            // MaterialApp(
            //    debugShowCheckedModeBanner: false,
            //   home: PageSplash(
                      
            // //             futures: [
            // //               SharedPreferences.getInstance(),
            // // //               // UserAccount.getPersistenceUser(),
            // // //               // getApplicationDocumentsDirectory().then((dir) {
            // // //               //   Hive.init(dir.path);
            // // //               //   return Hive.openBox<Map>("player");
            // // //               // }),
            // //             ],
            //   builder: (context) {
            //     return 
            //     MyApp(
            //       // setting: Settings(data[0]),
            //       // user: data[1],
               
            //     );//;;
            //   },
              
            //           ),
            // )


        )
 );

}



// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Using MultiProvider is convenient when providing multiple objects.
//     return MultiProvider(
//       providers: [
//         // In this sample app, CatalogModel never changes, so a simple Provider
//         // is sufficient.
//         Provider(create: (context) => CatalogModel()),
//         // CartModel is implemented as a ChangeNotifier, which calls for the use
//         // of ChangeNotifierProvider. Moreover, CartModel depends
//         // on CatalogModel, so a ProxyProvider is needed.
//         ChangeNotifierProxyProvider<CatalogModel, CartModel>(
//           create: (context) => CartModel(),
//           update: (context, catalog, cart) {
//             if (cart == null) throw ArgumentError.notNull('cart');
//             cart.catalog = catalog;
//             return cart;
//           },
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Provider Demo',
//         theme: appTheme,
//         initialRoute: '/',
//         routes: {
//           '/': (context) => MyLogin(),
//           '/catalog': (context) => MyCatalog(),
//           '/cart': (context) => MyCart(),
//         },
//       ),
//     );
//   }
// }




// class MyApp extends StatelessWidget {

  

//   @override
//   Widget build(BuildContext context) {

//     return 
//     MultiProvider(
      
//       providers: [
//         Provider<AppDatabaseLocal>(    //dispose: (context, db) => db.close(),
//             create: (context) => AppDatabaseLocal() ), // (_)
//       ],
//       child:
//        ChangeNotifierProvider<ThemeProvider>(
//         create: (context) => ThemeProvider(),
//         builder: (context, _) {
//           final themeProvider = Provider.of<ThemeProvider>(context);
//           return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               themeMode: themeProvider.themeMode,
//               theme: MyThemes.lightTheme,
//               darkTheme: MyThemes.darkTheme,
//             title: 'E-Commerce BLoC + Provider',
//             initialRoute: getInitialRoute(),
//             routes: routes,
//           );
//         }
//       ),
//     );
//   }
// }
