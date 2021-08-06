import 'package:ecomproj/app_config/routes.dart';
import 'package:ecomproj/app_config/theme_app.dart';
import 'package:ecomproj/bloc/bag.dart';
import 'package:ecomproj/bloc/database_local_bloc.dart';
import 'package:ecomproj/bloc/like.dart';
// import 'package:ecomproj/bloc/product.dart';
import 'package:ecomproj/screen/page/home_screen.dart';
import 'package:ecomproj/screen/page/navigation_button.dart';
import 'package:ecomproj/screen/page/splash/page_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

// ignore: implementation_imports
import 'package:provider/src/change_notifier_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//TODO: navigation screen button bar
//TODO: MyApp() создать и переделать

void main() {


  //  debugDefaultTargetPlatformOverride = TargetPlatform.android;
  WidgetsFlutterBinding.ensureInitialized();
  // neteaseRepository = NeteaseRepository();
  // api.debugPrint = debugPrint;
  // Logger.root.onRecord.listen((record) {
  //   debugPrint('${record.time} ${record.level.name} ${record.loggerName}: ${record.message}');
  // });
  WidgetsFlutterBinding.ensureInitialized();

  

 SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) =>
        runApp(
              MyAppS()

      //     MultiProvider(
      //     providers: [
      //        Provider<BlockBag>(create: (context)=> BlockBag() ),
      //       Provider<DatabaseLocalBloc>(   // dispose: (context, db) => db.close(),
      //        create: (context) => DatabaseLocalBloc() ), 
      //     ],
      //     builder: (context, _) {
     
      //     final themeProvider = Provider.of<ThemeProvider>(context);
      //     return MaterialApp(
      //         debugShowCheckedModeBanner: false,
      //         themeMode: themeProvider.themeMode,
      //         theme: MyThemes.lightTheme,
      //         darkTheme: MyThemes.darkTheme,
      //       title: 'E-Commerce BLoC + Provider',
      //       initialRoute: getInitialRoute(),
      //       routes: routes,
      //     );
      //   }
      // ),

    )
          
            // MaterialApp(
            //    debugShowCheckedModeBanner: false,
            //   home: PageSplash(
                      
            //              futures: [
            //                SharedPreferences.getInstance(),
            //                 UserAccount.getPersistenceUser(),
            //              ],
            //   builder: (context) {
            //     return 
            //     MyApp(
            //        user: data[1],
            //     );
            //   },
              
            //           ),
            // )


        );

}


class MyAppS extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
          providers: [
            ChangeNotifierProvider<BagCacheBlock>(create: (context)=> BagCacheBlock() ),
            Provider<DatabaseLocalBloc>(create: (context)=> DatabaseLocalBloc(), 
                  dispose: (context, db) => db.close() ),
            // Provider<DatabaseLocalBloc>(   // dispose: (context, db) => db.close(),
            //   create: (context) => DatabaseLocalBloc() ), 
            ChangeNotifierProvider(create: (context) => ThemeProvider())
          ],
          builder: (context, _) {
     
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
            title: 'E-Commerce BLoC + Provider',
            // initialRoute: getInitialRoute(),
            // routes: routes,
            home: ButtonNavBar() //ButtonNavBar(),
          );

        }
      );

  }

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
