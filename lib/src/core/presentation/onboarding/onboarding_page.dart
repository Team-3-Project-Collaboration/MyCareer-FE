import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_fe/src/core/presentation/onboarding/widgets/button_rounded.dart';
import 'package:provider/provider.dart';
import 'onboarding_state.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnboardingState(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<OnboardingState>(
            builder: (context, onboardingState, child) {
              double screenHeight = MediaQuery.of(context).size.height;

              return Column(
                children: [
                  SizedBox(height: screenHeight * 0.09),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
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
                    onboardingState.currentPageData['image'],
                    width: 350,
                    height: screenHeight * 0.3,
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    onboardingState.currentPageData['textTitle'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20),
                  Text(
                    onboardingState.currentPageData['textBody'],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 120),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (onboardingState.currentPage > 0)
                        RoundButtonPrevious(
                          onPressed: onboardingState.previousPage,
                        ),
                      Expanded(
                        child: SvgPicture.asset(
                          onboardingState.currentPageData['paginationDots'],
                          height: 12,
                        ),
                      ),
                      RoundButtonNext(onPressed: onboardingState.nextPage),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
