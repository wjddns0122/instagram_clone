import 'package:get/get.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class BottomNavController extends GetxController {
  final RxInt _pageIndex = 0.obs;

  final List<int> _history = [0];

  int get index => _pageIndex.value;

  void changeIndex(int value) {
    var page = Page.values[value];
    switch (page) {
      case Page.HOME:
      case Page.SEARCH:
      case Page.UPLOAD:
      case Page.REELS:
      case Page.MYPAGE:
        moveToPage(value);
    }
  }

  void moveToPage(int value) {
    _pageIndex(value);
  }
}
