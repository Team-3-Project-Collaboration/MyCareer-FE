import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NewPasswordController extends GetxController {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isObscure = true.obs;

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    return null;
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  void submitNewPassword() {
    // Implement logic to submit the new password here
  }
}
