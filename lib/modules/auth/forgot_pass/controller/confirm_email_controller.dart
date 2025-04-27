import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConfirmEmailController extends GetxController {
  var emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    return null;
  }

  void sendEmail() {
    // Implement email sending logic here
  }
}
