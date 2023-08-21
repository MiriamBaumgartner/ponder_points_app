import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/primary_button.dart';
import 'package:ponder_points_app/provider/quote_provider.dart';
import 'package:ponder_points_app/quotes_data/quotes_from_internet.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class QuotesScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  QuotesScreen({
    super.key,
  });

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final bool isLoading = false;
  final nextQuote = QuoteFromInternet.fromJson;

  getNextQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      final quote = QuoteFromInternet.fromJson(jsonDecode(response.body));
      print('quotefrominternet: ${quote.content}');
    } else {
      CircularProgressIndicator();
    }
  }

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
                  print('calling next quote');
                  getNextQuote();
                  // quoteProvider.randomQuote();
                }),
          ],
        ),
      ),
    );
  }
}
