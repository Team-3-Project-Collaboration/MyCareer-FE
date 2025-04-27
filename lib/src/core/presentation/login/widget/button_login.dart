import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonLogin extends StatelessWidget {
  final String text;
  final String? leadingSvg;
  final Color buttonColor;
  final Color? borderColor;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButtonLogin({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
    this.leadingSvg,
    this.borderColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 406,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
            side:
                borderColor != null
                    ? BorderSide(color: borderColor!)
                    : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingSvg != null) ...[
              SvgPicture.asset(leadingSvg!, width: 24, height: 24),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
