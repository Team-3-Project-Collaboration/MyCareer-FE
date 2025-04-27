import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';
import 'package:mycareer/modules/onboarding/controller/onboarding_controller.dart';
import 'package:mycareer/modules/onboarding/widgets/button_rounded.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.put(
      OnboardingController(),
    );

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: screenHeight * 0.09),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(NavigationRoutes.signIn);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SvgPicture.asset(
                onboardingController.currentPageData['image'],
                width: 350,
                height: screenHeight * 0.3,
              ),
              SizedBox(height: screenHeight * 0.1),
              Text(
                onboardingController.currentPageData['textTitle'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                onboardingController.currentPageData['textBody'],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (onboardingController.currentPage.value > 0)
                    RoundButtonPrevious(
                      onPressed: onboardingController.previousPage,
                    ),
                  Expanded(
                    child: SvgPicture.asset(
                      onboardingController.currentPageData['paginationDots'],
                      height: 12,
                    ),
                  ),
                  RoundButtonNext(onPressed: onboardingController.nextPage),
                  SizedBox(width: 10),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
