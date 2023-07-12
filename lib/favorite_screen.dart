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
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (BuildContext context, int index) {
          final favorite = widget.favorites[index];
          return ListTile(
            title: Text(favorite),
          );
        },
      ),
    );
  }
}
