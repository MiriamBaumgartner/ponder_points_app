import 'package:flutter/material.dart';
import 'package:ponder_points_app/provider/quote_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const FavoriteScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<QuoteProvider>(
      builder: (context, quoteProvider, child) {
        return ListView.builder(
          itemCount: quoteProvider.favoriteQuotes.length,
          itemBuilder: (BuildContext context, int index) {
            final favoriteQuote = quoteProvider.favoriteQuotes[index];
            if (quoteProvider.favoriteQuotes.isEmpty) {
              return const Center(child: Text('Your favorites list is empty.'));
            }
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: IconButton(
                    onPressed: () =>
                        quoteProvider.removeFavorite(favoriteQuote),
                    icon: const Icon(
                      Icons.favorite,
                    )),
                title: Text(favoriteQuote.text),
                subtitle: Text(favoriteQuote.author),
              ),
            );
          },
        );
      },
    ));
  }
}
