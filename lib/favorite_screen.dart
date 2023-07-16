import 'package:flutter/material.dart';
import 'package:ponder_points_app/models/quote.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    required this.favorites,
  });

  final List<Quote> favorites;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favorites.isEmpty) {
      return const Center(child: Text('Your favorites list is empty.'));
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          final favoriteQuote = widget.favorites[index];

          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: IconButton(
                  onPressed: () => removeFavorite(favoriteQuote),
                  icon: const Icon(
                    Icons.favorite,
                  )),
              title: Text(favoriteQuote.text),
              subtitle: Text(favoriteQuote.author),
            ),
          );
        },
      ),
    );
  }

  void removeFavorite(Quote currentQuote) {
    setState(() {
      widget.favorites.remove(currentQuote);
    });
  }
}
