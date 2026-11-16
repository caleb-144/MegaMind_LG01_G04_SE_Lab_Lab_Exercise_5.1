import 'package:flutter/material.dart';

class ShareStateManagement extends ChangeNotifier {
  // Total number of navigation destinations
  static const int pageCount = 5;

  // Currently selected navigation index
  int _currentIndex = 0;

  // Getter to access the selected index
  int get currentIndex => _currentIndex;

  // Update the selected navigation index
  void setIndex(int index) {
    // Prevent invalid navigation indexes
    if (index < 0 || index >= pageCount) return;

    // Only notify listeners when the index changes
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
