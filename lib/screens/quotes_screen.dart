// ignore_for_file: prefer_interpolation_to_compose_strings, duplicate_ignore

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
        child: quoteProvider.isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (isLoading) CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '"' +
                          (quoteProvider.quoteFromInternet?.content ?? '-') +
                          '"',
                      // '"${quoteProvider.currentQuote.text}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  // ignore: duplicate_ignore
                  Text(
                    '- ' + (quoteProvider.quoteFromInternet?.author ?? '...'),
                    // ignore: prefer_interpolation_to_compose_strings
                    // '- ' + quoteProvider.currentQuote.author,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  IconButton(
                    onPressed: () => quoteProvider
                        .toggleFavorite(quoteProvider.quoteFromInternet),
                    icon: Icon(quoteProvider.favoriteQuotes
                            .contains(quoteProvider.quoteFromInternet)
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
                        quoteProvider.getNextQuote();

                        // quoteProvider.randomQuote();
                      }),
                ],
              ),
      ),
    );
  }
}
