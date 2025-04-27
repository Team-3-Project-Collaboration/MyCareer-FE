import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/global_component/bottom_nav.dart';
import 'package:mycareer/core/helper/bottom_nav_controller.dart';
import 'package:mycareer/modules/auth/sign_in/sign_in_page.dart';
import 'package:mycareer/modules/career_bot/career_bot_screen.dart';
import 'package:mycareer/modules/career_hub/career_hub_screen.dart';
import 'package:mycareer/modules/career_path/career_path_screen.dart';
import 'package:mycareer/modules/homepage/homepage/homepage_screen.dart';
import 'package:mycareer/modules/profile/profile_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());

    return Scaffold(
      body: Obx(() {
        switch (navController.selectedIndex.value) {
          case 0:
            return HomePage();
          case 1:
            return CareerPathScreen();
          case 2:
            return CareerBotScreen();
          case 3:
            return CareerHubScreen();
          case 4:
            return ProfileScreen();
          default:
            return const SizedBox.shrink();
        }
      }),
      bottomNavigationBar: BottomNav(),
    );
  }
}
