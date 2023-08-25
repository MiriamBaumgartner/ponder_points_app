import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quotes_from_internet.dart';
import 'package:http/http.dart' as http;

class QuoteProvider extends ChangeNotifier {
  final List<QuoteFromInternet?> favoriteQuotes = [];
  bool isLoading = true;
  QuoteFromInternet? quoteFromInternet;

  QuoteProvider() {
    getNextQuote();
  }

  void removeFavorite(QuoteFromInternet? currentQuote) {
    favoriteQuotes.remove(currentQuote);
    notifyListeners();
  }

  void toggleFavorite(QuoteFromInternet? currentQuote) {
    if (favoriteQuotes.contains(currentQuote)) {
      favoriteQuotes.remove(currentQuote);
    } else {
      favoriteQuotes.add(currentQuote);
    }
    notifyListeners();
  }

  void getNextQuote() async {
    isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      quoteFromInternet = QuoteFromInternet.fromJson(jsonDecode(response.body));
      // print('quotefrominternet: ${quote.content}');
    } else {}

    isLoading = false;

    notifyListeners();
  }
}

  // randomQuote() {
  //   final random = Random();
  //   final randomInt = random.nextInt(quotes.length);

  //   currentQuote = quotes[randomInt];
  //   notifyListeners();
  // }}
