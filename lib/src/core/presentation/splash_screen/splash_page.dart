import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Menggunakan widget Center sebagai parent
        child: Stack(
          children: [
            // Container dengan Gradient Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF3355FF), Color(0xFF99AAFF)],
                  stops: [0.0, 0.97],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Center(
              child: SvgPicture.asset(
                "assets/svgs/logo_mycareer.svg",
                width: 184,
                height: 179,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
