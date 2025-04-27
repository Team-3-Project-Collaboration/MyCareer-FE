import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';
import 'package:mycareer/modules/auth/forgot_pass/controller/new_password_controller.dart';
import 'package:mycareer/modules/auth/widget/account_status_text.dart';
import 'package:mycareer/modules/auth/widget/button_login.dart';
import 'package:mycareer/modules/auth/widget/text_input_field.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final NewPasswordController controller = Get.put(NewPasswordController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Lupa Password',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Divider(thickness: 1, color: Color(0xFF024CAA)),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Kami mengirim tautan reset ke ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "arkavidia@gmail.com",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " masukkan kode 5 digit yang disebutkan di email",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Obx(
                            () => TextInputField.password(
                              hintText: "Masukkan password",
                              labelText: "Password Baru",
                              isPasswordField: true,
                              validator: controller.validatePassword,
                              isObscure: controller.isObscure.value,
                              controller: controller.passwordController,
                              // onTapIcon: controller.toggleObscure,
                            ),
                          ),
                          SizedBox(height: 16),
                          Obx(
                            () => TextInputField.password(
                              hintText: "Masukkan password",
                              labelText: "Konfirmasi Password",
                              isPasswordField: true,
                              validator: controller.validatePassword,
                              isObscure: controller.isObscure.value,
                              controller: controller.confirmPasswordController,
                              // onTapIcon: controller.toggleObscure,
                            ),
                          ),
                          SizedBox(height: 46),
                          CustomButtonLogin(
                            text: 'Kirim',
                            buttonColor: const Color(0xFF3355FF),
                            onPressed: controller.submitNewPassword,
                          ),
                          Spacer(), // Spacer untuk memberi ruang dinamis sebelum ReusableText
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
