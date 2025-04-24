import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/account_status_text.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/button_login.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/text_input_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
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
            TextInputField(hintText: "Masukkan nama Anda", labelText: "Nama"),
            SizedBox(height: 8),
            TextInputField(hintText: "Masukkan email Anda", labelText: "Email"),
            SizedBox(height: 8),
            TextInputField(
              hintText: "Masukkan password",
              labelText: "Password",
              isPasswordField: true,
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
            SizedBox(height: 80),
            ReusableText(
              titleText: "Sudah Punya Akun? ",
              actionText: "Masuk",
              onActionTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
