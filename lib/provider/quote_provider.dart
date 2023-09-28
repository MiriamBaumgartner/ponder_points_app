import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quotes_from_internet.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuoteProvider extends ChangeNotifier {
  final favoritesListkey = 'favoritesListkey';
  final List<QuoteFromInternet?> favoriteQuotes = [];
  bool isLoading = true;
  bool isLoadingPreferences = true;
  QuoteFromInternet? quoteFromInternet;

  QuoteProvider() {
    getNextQuote();
    loadFromSharedPreferences();
  }

  loadFromSharedPreferences() async {
    isLoadingPreferences = true;
    final prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString(favoritesListkey);

    if (jsonString != null) {
      List<Map<String, dynamic>> quotesAsJson =
          List<Map<String, dynamic>>.from(json.decode(jsonString));
      favoriteQuotes.clear();
      quotesAsJson.forEach((quoteAsJson) {
        favoriteQuotes.add(QuoteFromInternet.fromJson(quoteAsJson));
      });
    }

    isLoadingPreferences = false;

    notifyListeners();
  }

  saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(favoritesListkey, json.encode(favoriteQuotes));
    print('funktioniert');
  }

  void toggleFavorite(QuoteFromInternet? currentQuote) {
    if (favoriteQuotes.contains(currentQuote)) {
      favoriteQuotes.remove(currentQuote);
    } else {
      favoriteQuotes.add(currentQuote);
    }
    saveToSharedPreferences();
    notifyListeners();
  }

  void getNextQuote() async {
    isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      quoteFromInternet = QuoteFromInternet.fromJson(jsonDecode(response.body));
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
