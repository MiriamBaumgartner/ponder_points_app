import 'package:flutter/material.dart';

class ChangeTab extends ChangeNotifier {
  int selectedTab = 0;

  void changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
