import 'package:flutter/material.dart';
import 'package:ponder_points_app/primary_button.dart';
import 'package:ponder_points_app/provider/quote_provider.dart';
import 'package:provider/provider.dart';

class QuotesScreen extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  QuotesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final quoteProvider = context.watch<QuoteProvider>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '"${quoteProvider.currentQuote.text}"',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Text(
              // ignore: prefer_interpolation_to_compose_strings
              '- ' + quoteProvider.currentQuote.author,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              width: 40,
              height: 40,
            ),
            IconButton(
              onPressed: () =>
                  quoteProvider.toggleFavorite(quoteProvider.currentQuote),
              icon: Icon(quoteProvider.favoriteQuotes
                      .contains(quoteProvider.currentQuote)
                  ? Icons.favorite
                  : Icons.favorite_border),
              iconSize: 50,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
                text: 'Next Quote',
                onPressed: () {
                  quoteProvider.randomQuote();
                }),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.purple,
      //   onPressed: () => quoteProvider.randomQuote(),
      //   child: const Icon(
      //     Icons.add,
      //   ),
      // ),
    );
  }
}
