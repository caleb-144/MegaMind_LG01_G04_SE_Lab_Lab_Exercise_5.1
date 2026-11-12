import 'package:flutter/material.dart';

class ShareStateManagement extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    if (index < 0 || index > 4) return;

    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
