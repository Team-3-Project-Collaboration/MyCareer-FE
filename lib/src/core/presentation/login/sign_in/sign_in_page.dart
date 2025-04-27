import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/constants/constants.dart';
import 'package:mycareer_fe/src/core/presentation/login/sign_in/sign_in_controller.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/account_status_text.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/button_login.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/text_input_field.dart';
import 'package:mycareer_fe/src/network/network_exceptions.dart';
import 'package:mycareer_fe/src/widgets/snack_bar_widget.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signInControllerProvider, (prevState, state) {
      if (prevState?.loginValue != state.loginValue) {
        state.loginValue.whenOrNull(
          error: (error, stackTrace) {
            final message = NetworkExceptions.getErrorMessage(
              error as NetworkExceptions,
            );
            appSnackBar(context, ColorApp.red500, message);
          },
        );
      }
    });

    final state = ref.watch(signInControllerProvider);
    final controller = ref.read(signInControllerProvider.notifier);
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
              isObscure: state.isObscure,
              controller: controller.passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
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
              onPressed: () {},
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
              onPressed: () {},
            ),
            // Avoid using Spacer directly, as it may cause layout issues
            SizedBox(
              height: 140,
            ), // Add a fixed space at the bottom to prevent overflow when keyboard appears
            ReusableText(
              titleText: "Tidak Punya Akun? ",
              actionText: "Daftar",
              onActionTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
