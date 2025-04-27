import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mycareer/core/services/endpoints.dart';
import 'package:mycareer/core/utils/route_utils.dart';

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

  Future<void> signIn() async {
    final email = emailController.text;
    final password = passwordController.text;

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email or password cannot be empty");
      return;
    }

    // Kirim request login
    try {
      final response = await http.post(
        Uri.parse(
          Endpoints.login,
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final data = responseData['data'];

        // Simpan token dan data lainnya
        String token = data['token'];
        String role = data['role'];

        // Navigasi ke halaman berikutnya
        Get.offNamed(NavigationRoutes.mainMenu);

        // Menampilkan pesan sukses
        Get.snackbar("Login Successful", "Welcome back, ${data['email']}");
      } else {

        Get.snackbar("Login Failed", "Invalid email or password");
      }
    } catch (e) {

      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }
}
