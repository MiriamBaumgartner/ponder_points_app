import 'dart:math';

import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({
    super.key,
  });

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<String> quotes = [
    '"The only way to achieve the impossible is to believe it is possible."',
    '"Believe you can and you are halfway there."',
    '"The only limit to our realization of tomorrow will be our doubts of today." ',
    '"The future belongs to those who believe in the beauty of their dreams."',
    '"Dont be afraid to give up the good to go for the great."',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 181, 243),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                getQuote(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(
              width: 40,
              height: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              iconSize: 50,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }

  String getQuote() {
    final _random = Random();
    final randomInt = _random.nextInt(quotes.length);
    print(randomInt);
    var quote = quotes[randomInt];
    return quote;
  }
}
