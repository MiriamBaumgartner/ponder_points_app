import 'package:flutter/material.dart';
import 'package:ponder_points_app/quotes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: QuotesScreen(),
    );
  }
}
