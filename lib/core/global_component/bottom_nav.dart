import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/helper/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  final NavController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: (index) => navController.changeTabIndex(index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/home.svg',
              height: 25,
              width: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/careerpath.svg',
              height: 25,
              width: 25,
            ),
            label: 'Career Path',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/mycareer.svg',
              height: 40,
              width: 40,
            ),
            label: 'Career Path',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/careerhub.svg',
              height: 25,
              width: 25,
            ),
            label: 'Career Hub',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svgs/profile.svg',
              height: 25,
              width: 25,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
