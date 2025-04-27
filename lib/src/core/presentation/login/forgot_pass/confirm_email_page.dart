import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/core/presentation/login/sign_in/sign_in_controller.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/account_status_text.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/button_login.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/text_input_field.dart';

class ConfirmEmailPage extends ConsumerWidget {
  const ConfirmEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signInControllerProvider);
    final controller = ref.read(signInControllerProvider.notifier);
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
                            onPressed: () {},
                          ),
                          Spacer(), // Spacer untuk memberi ruang dinamis sebelum ReusableText
                          ReusableText(
                            titleText: "Tidak Punya Akun? ",
                            actionText: "Daftar",
                            onActionTap: () {},
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
