import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String titleText;
  final String actionText;
  final GestureTapCallback onActionTap;

  const ReusableText({
    super.key,
    required this.titleText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: titleText,
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: actionText,
            style: TextStyle(
              color: const Color(0xFF2080D9),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()..onTap = onActionTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
