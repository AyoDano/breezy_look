import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
// if für performance verbesserung, da notifylisteners nicht aufegrufen wird wenn
// sich im aktuellen index nicht verändert hat
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}
