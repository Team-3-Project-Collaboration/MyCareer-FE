import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String labelText; // Menambahkan parameter untuk label
  final String hintText; // Menambahkan parameter untuk hint
  final bool
  isPasswordField; // Menambahkan parameter untuk menentukan apakah field adalah password

  const TextInputField({
    super.key,
    required this.labelText, // Memastikan parameter labelText diisi saat pembuatan widget
    required this.hintText, // Memastikan parameter hintText diisi saat pembuatan widget
    this.isPasswordField = false, // Default ke false jika bukan password
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isObscure =
      true; // Untuk mengontrol apakah teks password disembunyikan atau tidak

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText, // Menggunakan parameter labelText
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 7),
        TextFormField(
          obscureText:
              widget.isPasswordField
                  ? _isObscure
                  : false, // Mengatur apakah teks disembunyikan (hanya jika field adalah password)
          decoration: InputDecoration(
            hintText: widget.hintText, // Menggunakan parameter hintText
            labelStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Color(0xFFBCBCBC), width: 2.0),
            ),
            suffixIcon:
                widget.isPasswordField
                    ? IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF3355FF),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure; // Toggle visibility
                        });
                      },
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
