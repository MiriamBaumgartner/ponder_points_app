import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quotes_from_internet.dart';

class QuoteProvider extends ChangeNotifier {
  final List<QuoteFromInternet?> favoriteQuotes = [];

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

  // randomQuote() {
  //   final random = Random();
  //   final randomInt = random.nextInt(quotes.length);

  //   currentQuote = quotes[randomInt];
  //   notifyListeners();
  // }
}
