import 'dart:io';

import 'package:get/get.dart';
import 'package:instagram/src/binding/upload_binding.dart';
import 'package:instagram/view/upload.dart';

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
      case Page.REELS:
      case Page.MYPAGE:
        moveToPage(value);
        break;
      case Page.UPLOAD:
        moveToUpload();
        break;
    }
  }

  void moveToUpload() {
    Get.to(() => const Upload(),
        transition: Transition.leftToRightWithFade,
        popGesture: false,
        binding: UploadBinding());
  }

  void moveToPage(int value) {
    if (_history.last != value && Platform.isAndroid) {
      _history.add(value);
    }
    _pageIndex(value);
  }

  Future<bool> popAction() async {
    if (_history.length == 1) {
      return true;
    } else {
      _history.removeLast();
      _pageIndex(_history.last);
      return false;
    }
  }
}
