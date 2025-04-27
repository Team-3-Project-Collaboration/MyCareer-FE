import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  // Reactive list of TextEditingController for each input field
  RxList<TextEditingController> controllers =
      List.generate(5, (_) => TextEditingController()).obs;

  // Function to handle the text change and move focus
  void onTextChanged(int index, String value) {
    if (value.length == 1 && index < 4) {
      FocusScope.of(Get.context!).nextFocus();
    }
    if (value.isEmpty && index > 0) {
      FocusScope.of(Get.context!).previousFocus();
    }
  }

  // Get the combined verification code from all fields
  String getVerificationCode() {
    return controllers.map((controller) => controller.text).join();
  }
}
