import 'package:flutter/material.dart';

enum InputFormType { normal, password }

class TextInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool isPasswordField;
  final bool isObscure;
  final Function()? onObscureTap;
  final InputFormType inputFormType;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
  }) : inputFormType = InputFormType.normal,
       isObscure = false,
       onObscureTap = null;

  const TextInputField.password({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isObscure = true,
    this.onObscureTap,
    this.isPasswordField = true,
    this.validator,
  }) : inputFormType = InputFormType.password;

  const TextInputField.email({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.isPasswordField = false,
    this.validator,
  }) : inputFormType = InputFormType.normal,
       isObscure = false,
       onObscureTap = null;

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 7),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPasswordField ? _isObscure : false,
          keyboardType:
              widget.inputFormType == InputFormType.normal
                  ? TextInputType.emailAddress
                  : TextInputType.text,
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
                      onPressed:
                          widget.onObscureTap ??
                          () {
                            setState(() {
                              _isObscure = !_isObscure; // Toggle visibility
                            });
                          },
                    )
                    : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
