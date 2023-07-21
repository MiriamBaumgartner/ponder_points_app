import 'package:flutter/material.dart';
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
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
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
            SizedBox(
              width: 30,
            ),
            ElevatedButton(
                onPressed: () => quoteProvider.randomQuote(),
                child: Text('next quote'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange))),
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
