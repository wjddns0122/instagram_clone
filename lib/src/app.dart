import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/src/controller/bottom_nav_controller.dart';
import 'package:instagram/src/widget/image_avatar.dart';
import 'package:instagram/src/widget/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _body(),
        bottomNavigationBar: _bottom(),
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
                  'https://i.namu.wiki/i/1qw3h7kT7UX47Ms2rU0tt32PhsprNT5LKKrX2Xc08nHE5DTUxACuTf_qtfJ6q-N8TfbU-hgWBXpLsG-BsE_HBAExyV-Z5Zo6Ypr-eRW8Bsh3IWOIEMQTq5e0wHmSndZOQnflaAqk_QeAryuMkjcbKw.webp',
              type: AvatarType.OFF,
            ),
            activeIcon: ImageAvatar(
              url:
                  'https://i.namu.wiki/i/1qw3h7kT7UX47Ms2rU0tt32PhsprNT5LKKrX2Xc08nHE5DTUxACuTf_qtfJ6q-N8TfbU-hgWBXpLsG-BsE_HBAExyV-Z5Zo6Ypr-eRW8Bsh3IWOIEMQTq5e0wHmSndZOQnflaAqk_QeAryuMkjcbKw.webp',
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
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.black,
        ),
      ],
    );
  }
}
