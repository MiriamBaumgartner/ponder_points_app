import 'package:flutter/material.dart';
import 'package:ponder_points_app/change_tab_provider.dart';
import 'package:ponder_points_app/styles.dart';
import 'package:provider/provider.dart';
import 'package:ponder_points_app/provider/quote_provider.dart';

import 'bird_test.dart';
import 'bottom_navigation_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ChangeTab(),
      child: ChangeNotifierProvider(
        create: (context) => QuoteProvider(),
        child: const MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    birdTest();
    return MaterialApp(
      title: 'Ponder Points',
      home: BottomNavigationScreen(),
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        appBarTheme: AppBarTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
        ),
      ),
    );
  }
}
