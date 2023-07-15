import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    required this.favorites,
  });

  final List<String> favorites;

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
          final favorite = widget.favorites[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: IconButton(
                  onPressed: () => removeFavorite(favorite),
                  icon: const Icon(
                    Icons.favorite,
                  )),
              title: Text(favorite),
            ),
          );
        },
      ),
    );
  }

  void removeFavorite(String currentQuote) {
    setState(() {
      widget.favorites.remove(currentQuote);
    });
  }
}
