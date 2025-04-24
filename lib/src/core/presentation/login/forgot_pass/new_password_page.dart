import 'package:flutter/material.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/account_status_text.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/button_login.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/text_input_field.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          TextInputField(
                            hintText: "Masukkan password",
                            labelText: "Password Baru",
                            isPasswordField: true,
                          ),
                          SizedBox(height: 16),
                          TextInputField(
                            hintText: "Masukkan password",
                            labelText: "Konfirmasi Password ",
                            isPasswordField: true,
                          ),
                          SizedBox(height: 46),
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
