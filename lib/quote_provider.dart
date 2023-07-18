import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/quotes_data/quotes_data.dart';

import 'models/quote.dart';

class QuoteProvider extends ChangeNotifier {
  final List<Quote> favoriteQuotes = [];
  Quote currentQuote = quotes.first;

  void removeFavorite(Quote currentQuote) {
    favoriteQuotes.remove(currentQuote);
    notifyListeners();
  }

  void toggleFavorite(Quote currentQuote) {
    if (favoriteQuotes.contains(currentQuote)) {
      favoriteQuotes.remove(currentQuote);
    } else {
      favoriteQuotes.add(currentQuote);
    }
    notifyListeners();
  }

  randomQuote() {
    final random = Random();
    final randomInt = random.nextInt(quotes.length);

    currentQuote = quotes[randomInt];
    notifyListeners();
  }
}
