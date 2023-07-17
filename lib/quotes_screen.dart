import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quote.dart';
import 'package:ponder_points_app/quote_provider.dart';
import 'package:ponder_points_app/quotes_data/quotes_data.dart';
import 'package:provider/provider.dart';

class QuotesScreen extends StatefulWidget {
  QuotesScreen({
    super.key,
  });

  late Quote currentQuote = getQuote();

  Quote getQuote() {
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
                '"${widget.currentQuote.text}"',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Text(
              '- ' + widget.currentQuote.author,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              width: 40,
              height: 40,
            ),
            Consumer<QuoteProvider>(
              builder: (context, quoteProvider, child) {
                return IconButton(
                  onPressed: () =>
                      quoteProvider.toggleFavorite(widget.currentQuote),
                  icon: Icon(
                      quoteProvider.favoriteQuotes.contains(widget.currentQuote)
                          ? Icons.favorite
                          : Icons.favorite_border),
                  iconSize: 50,
                  color: Colors.purple,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
