import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';

class SplashController extends GetxController {
  void navigateToNextPage() {
    Future.delayed(Duration(seconds: 3), () {
      Get.toNamed(NavigationRoutes.onboarding);
    });
  }

  @override
  void onInit() {
    super.onInit();
    navigateToNextPage();
  }
}
