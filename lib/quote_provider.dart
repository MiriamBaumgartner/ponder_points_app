import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/quote.dart';

class QuoteProvider extends ChangeNotifier {
  final List<Quote> favoriteQuotes = [];

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
}
