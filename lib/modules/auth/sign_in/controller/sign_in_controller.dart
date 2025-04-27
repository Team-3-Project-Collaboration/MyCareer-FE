import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObscure = true.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isObscure.value = !isObscure.value;
  }

  // Add other functions for sign-in logic if needed.
}
