import 'package:flutter/material.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/confirm_email_page.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/new_password_page.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/verification_code_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: NewPasswordPage(),
    );
  }
}
