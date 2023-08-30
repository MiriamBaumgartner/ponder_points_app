import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quotes_from_internet.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuoteProvider extends ChangeNotifier {
  final favoritesListkey = 'favoritesListkey';
  final List<QuoteFromInternet?> favoriteQuotes = [];
  bool isLoading = true;
  QuoteFromInternet? quoteFromInternet;

  QuoteProvider() {
    getNextQuote();
    loadFromSharedPreferences();
  }

  loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> quotesFromPref =
        json.decode(prefs.getString(favoritesListkey) ?? '');

    quotesFromPref.forEach((element) {
      print(QuoteFromInternet.fromJson(element));
    });

    // print('$quotesFromPref');
    // favoriteQuotes.add();
  }

  saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(favoritesListkey, json.encode(favoriteQuotes));
    print('funktioniert');
    loadFromSharedPreferences();
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
