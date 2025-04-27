import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';
import 'package:mycareer/modules/auth/sign_in/controller/sign_in_controller.dart';
import 'package:mycareer/modules/auth/widget/account_status_text.dart';
import 'package:mycareer/modules/auth/widget/button_login.dart';
import 'package:mycareer/modules/auth/widget/text_input_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final SignInController controller = Get.put(SignInController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 96),
            Text(
              "Masuk",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            Text(
              "Buat akun baru Anda dan mulai mencari hal baru!",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32),
            TextInputField(
              hintText: "Masukkan email Anda",
              labelText: "Email",
              validator: controller.validateEmail,
              controller: controller.emailController,
            ),
            SizedBox(height: 8),
            TextInputField.password(
              hintText: "Masukkan password",
              labelText: "Password",
              isPasswordField: true,
              validator: controller.validatePassword,
              isObscure: controller.isObscure.value,
              controller: controller.passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(NavigationRoutes.newPassword);
                },
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(
                    color: Color(0xFF3355FF),
                    decoration: TextDecoration.underline,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 31),
            CustomButtonLogin(
              text: 'Masuk',
              buttonColor: const Color(0xFF3355FF),
              onPressed: () {
                // Call sign-in logic
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Atau", style: TextStyle(color: Colors.black)),
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: 2)),
              ],
            ),
            SizedBox(height: 20),
            CustomButtonLogin(
              text: 'Lanjutkan dengan Google',
              textColor: Color(0xFF3355FF),
              buttonColor: Colors.white,
              leadingSvg: "assets/svgs/logo_google.svg",
              onPressed: () {
                // Call Google login logic
              },
            ),
            SizedBox(
              height: 140,
            ), // Add a fixed space at the bottom to prevent overflow when keyboard appears
            ReusableText(
              titleText: "Tidak Punya Akun? ",
              actionText: "Daftar",
              onActionTap: () {
                Get.toNamed(NavigationRoutes.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
