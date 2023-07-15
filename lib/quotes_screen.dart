import 'dart:math';

import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  QuotesScreen({
    super.key,
    required this.favorites,
  });

  final List<String> favorites;

  List<String> quotes = [
    '"The only way to achieve the impossible is to believe it is possible."',
    '"Believe you can and you are halfway there."',
    '"The only limit to our realization of tomorrow will be our doubts of today." ',
    '"The future belongs to those who believe in the beauty of their dreams."',
    '"Dont be afraid to give up the good to go for the great."',
  ];

  late String currentQuote = getQuote();

  String getQuote() {
    final _random = Random();
    final randomInt = _random.nextInt(quotes.length);

    var quote = quotes[randomInt];
    return quote;
  }

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.currentQuote);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 181, 243),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.currentQuote,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 40,
              height: 40,
            ),
            IconButton(
              onPressed: () => toggleFavorite(widget.currentQuote),
              icon: Icon(widget.favorites.contains(widget.currentQuote)
                  ? Icons.favorite
                  : Icons.favorite_border),
              iconSize: 50,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  void toggleFavorite(String currentQuote) {
    setState(() {
      if (widget.favorites.contains(currentQuote)) {
        widget.favorites.remove(currentQuote);
      } else {
        widget.favorites.add(currentQuote);
      }
    });
  }
}
