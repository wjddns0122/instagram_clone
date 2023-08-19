import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/src/controller/bottom_nav_controller.dart';
import 'package:instagram/src/widget/image_avatar.dart';
import 'package:instagram/src/widget/image_data.dart';
import 'package:instagram/view/mypage.dart';

import 'view/home.dart';
import 'view/search.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.popAction,
        child: Scaffold(
          body: _body(),
          bottomNavigationBar: _bottom(),
        ),
      ),
    );
  }

  Widget _bottom() {
    return BottomNavigationBar(
      currentIndex: controller.index,
      onTap: controller.changeIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.homeOff),
            activeIcon: ImageData(path: ImagePath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.searchOff),
            activeIcon: ImageData(path: ImagePath.searchOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.upload), label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: ImagePath.reelsOff),
            activeIcon: ImageData(path: ImagePath.reelsOn),
            label: 'home'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
              url:
                  'https://cdn.topstarnews.net/news/photo/202212/14825385_1049663_2440.jpg',
              type: AvatarType.OFF,
            ),
            activeIcon: ImageAvatar(
              url:
                  'https://cdn.topstarnews.net/news/photo/202212/14825385_1049663_2440.jpg',
              type: AvatarType.ON,
            ),
            label: 'home')
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: controller.index,
      children: [
        const Home(),
        const Search(),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.yellow,
        ),
        const MyPage()
      ],
    );
  }
}
