import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quote.dart';
import 'package:ponder_points_app/quotes_screen.dart';
import 'package:provider/provider.dart';
import 'package:ponder_points_app/quote_provider.dart';

import 'bottom_navigation_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => QuoteProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomNavigationScreen(),
    );
  }
}
