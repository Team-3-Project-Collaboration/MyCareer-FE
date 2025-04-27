import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mycareer/modules/splash_screen/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller
    final SplashController splashController = Get.put(SplashController());

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3355FF), Color(0xFF99AAFF)],
                  stops: [0.0, 0.97],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                "assets/svgs/logo_mycareer.svg",
                width: 184,
                height: 179,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
