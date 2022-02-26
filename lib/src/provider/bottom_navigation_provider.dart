import 'package:flutter/foundation.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;

  int get currentIndex => _index;
  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}
