import 'package:flutter/material.dart';
import 'package:ponder_points_app/favorite_screen.dart';
import 'package:ponder_points_app/quotes_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen(this.favoriteQuotes, {super.key});
  final List<String> favoriteQuotes;

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedTab = 0;

  List pages = [];

  void changeTab(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  void initState() {
    pages = [
      QuotesScreen(favorites: widget.favoriteQuotes),
      FavoriteScreen(favorites: widget.favoriteQuotes),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var activeTabTitle = 'Ponder Points ';
    if (selectedTab == 1) {
      activeTabTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 181, 243),
        elevation: 0,
        centerTitle: true,
        title: Text(activeTabTitle),
      ),
      body: pages[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        onTap: (index) => changeTab(index),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote_outlined),
            label: 'Quote',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite')
        ],
      ),
    );
  }
}
