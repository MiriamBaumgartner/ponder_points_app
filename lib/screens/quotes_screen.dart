import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/primary_button.dart';
import 'package:ponder_points_app/provider/quote_provider.dart';
import 'package:ponder_points_app/models/quotes_from_internet.dart';
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
  bool isLoading = true;
  QuoteFromInternet? quoteFromInternet;

  @override
  void initState() {
    getNextQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final quoteProvider = context.watch<QuoteProvider>();
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (isLoading) CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      '"' + (quoteFromInternet?.content ?? '-') + '"',
                      // '"${quoteProvider.currentQuote.text}"',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Text(
                    '- ' + (quoteFromInternet?.author ?? '...'),
                    // ignore: prefer_interpolation_to_compose_strings
                    // '- ' + quoteProvider.currentQuote.author,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  IconButton(
                    onPressed: () =>
                        quoteProvider.toggleFavorite(quoteFromInternet),
                    icon: Icon(
                        quoteProvider.favoriteQuotes.contains(quoteFromInternet)
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
                        setState(() {
                          isLoading = true;
                          print('isloading: $isLoading');
                        });

                        print('calling next quote');
                        getNextQuote();

                        // quoteProvider.randomQuote();
                      }),
                ],
              ),
      ),
    );
  }

  void getNextQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      quoteFromInternet = QuoteFromInternet.fromJson(jsonDecode(response.body));
      // print('quotefrominternet: ${quote.content}');
    } else {}
    setState(() {
      isLoading = false;
    });
  }
}
