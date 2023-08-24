import 'package:flutter/material.dart';
import 'package:ponder_points_app/screens/favorite_screen.dart';
import 'package:ponder_points_app/screens/quotes_screen.dart';
import 'package:provider/provider.dart';
import '../change_tab_provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final List pages = [
    QuotesScreen(),
    const FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<ChangeTab>();

    var activeTabTitle = 'Ponder Points ';
    if (tabProvider.selectedTab == 1) {
      activeTabTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(activeTabTitle),
      ),
      body: pages[tabProvider.selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabProvider.selectedTab,
        onTap: (index) => tabProvider.changeTab(index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote_outlined),
            label: 'Quote',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite')
        ],
      ),
    );
  }
}
