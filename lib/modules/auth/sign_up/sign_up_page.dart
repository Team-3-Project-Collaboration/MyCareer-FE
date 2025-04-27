import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';
import 'package:mycareer/modules/auth/sign_up/controller/sign_up_controller.dart';
import 'package:mycareer/modules/auth/widget/account_status_text.dart';
import 'package:mycareer/modules/auth/widget/button_login.dart';
import 'package:mycareer/modules/auth/widget/text_input_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final SignUpController controller = Get.put(SignUpController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              "Daftar",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            Text(
              "Buat akun baru Anda dan mulai mencari hal baru!",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 32),
            TextInputField(
              hintText: "Masukkan nama Anda",
              labelText: "Nama",
              validator: controller.validateName,
              controller: controller.nameController,
            ),
            SizedBox(height: 8),
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
            SizedBox(height: 31),
            CustomButtonLogin(
              text: 'Masuk',
              buttonColor: const Color(0xFF3355FF),
              onPressed: () {
                // Call the sign-up logic
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
                // Call Google sign-up logic
              },
            ),
            SizedBox(height: 80),
            ReusableText(
              titleText: "Sudah Punya Akun? ",
              actionText: "Masuk",
              onActionTap: () {
                Get.toNamed(NavigationRoutes.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }
}
