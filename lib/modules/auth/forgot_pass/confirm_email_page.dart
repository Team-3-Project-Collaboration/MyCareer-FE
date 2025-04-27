import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycareer/core/utils/route_utils.dart';
import 'package:mycareer/modules/auth/forgot_pass/controller/confirm_email_controller.dart';
import 'package:mycareer/modules/auth/widget/account_status_text.dart';
import 'package:mycareer/modules/auth/widget/button_login.dart';
import 'package:mycareer/modules/auth/widget/text_input_field.dart';

class ConfirmEmailPage extends StatelessWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final ConfirmEmailController controller = Get.put(ConfirmEmailController());

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
                          Text(
                            "Silakan masukkan email Anda untuk mengatur ulang kata sandi",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 24),
                          TextInputField(
                            hintText: "Masukkan email Anda",
                            labelText: "Email",
                            validator: controller.validateEmail,
                            controller: controller.emailController,
                          ),
                          SizedBox(height: 64),
                          CustomButtonLogin(
                            text: 'Kirim',
                            buttonColor: const Color(0xFF3355FF),
                            onPressed: () {
                              controller.sendEmail(); // Call send email logic
                            },
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
