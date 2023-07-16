import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quote.dart';
import 'package:ponder_points_app/quotes_screen.dart';

import 'bottom_navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  List<Quote> favoriteQuotes = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomNavigationScreen(favoriteQuotes),
    );
  }
}
