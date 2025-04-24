import 'package:flutter/material.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/account_status_text.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/button_login.dart';
import 'package:mycareer_fe/src/core/presentation/login/widget/text_input_field.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

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
          'Periksa Email',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Divider(thickness: 0.5, color: Color(0xFF024CAA)),
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
                          SizedBox(height: 43),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              return SizedBox(
                                width: 50,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 1 && index < 4) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 57),
                          CustomButtonLogin(
                            text: 'Kirim',
                            buttonColor: const Color(0xFF3355FF),
                            onPressed: () {},
                          ),
                          Spacer(),
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
