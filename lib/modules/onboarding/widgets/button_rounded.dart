import 'package:flutter/material.dart';

class RoundButtonNext extends StatelessWidget {
  final VoidCallback onPressed;

  const RoundButtonNext({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xFF3355FF),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_forward, color: Colors.white, size: 24),
      ),
    );
  }
}

class RoundButtonPrevious extends StatelessWidget {
  final VoidCallback onPressed;

  const RoundButtonPrevious({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFF3355FF)),
        ),
        child: Icon(Icons.arrow_back, color: Color(0xFF3355FF), size: 24),
      ),
    );
  }
}
