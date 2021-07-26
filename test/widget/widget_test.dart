

import 'package:ecomproj/app_config/Lib_Pref.dart';
import 'package:ecomproj/app_config/routes.dart';
import 'package:ecomproj/bloc/bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecomproj/main.dart';
import 'package:provider/provider.dart';

void main() {

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  testWidgets("My test Widget main and Home", (WidgetTester tester) async {

      //ASSEMBLE
      await tester.pumpWidget(
        MultiProvider(
           providers: [
          Provider<BlockBag>(create: (context)=> BlockBag() ),
           ],
          child: ChangeNotifierProvider<ThemeProvider>( // <ThemeProvider>
            create: (context) => ThemeProvider(),
            builder: (context, _) {
               return MaterialApp(
                  initialRoute: getInitialRoute(),
                  routes: routes
                );
            }
          )
        )
      );

      final button = find.byType(FloatingActionButton);

      //ACT
      await tester.tap(button);
      await tester.pump();

      //ASSERT 
      final text = find.text("Greate");
      expect(text, findsOneWidget);

  });
}
