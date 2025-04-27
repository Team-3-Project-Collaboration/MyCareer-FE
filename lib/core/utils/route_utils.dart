import 'package:get/get.dart';
import 'package:mycareer/modules/auth/forgot_pass/confirm_email_page.dart';
import 'package:mycareer/modules/auth/forgot_pass/new_password_page.dart';
import 'package:mycareer/modules/auth/forgot_pass/verification_code_page.dart';
import 'package:mycareer/modules/auth/sign_in/sign_in_page.dart';
import 'package:mycareer/modules/auth/sign_up/sign_up_page.dart';
import 'package:mycareer/modules/onboarding/onboarding_page.dart';
import 'package:mycareer/modules/splash_screen/splash_page.dart';

class NavigationRoutes {
  static const String initial = '/';
  static const String onboarding = '/onboarding';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String verificationCode = '/verification-code';
  static const String newPassword = '/new-password';
  static const String confirmEmail = '/confirm-email';

  static const String profile = '/profile';
  static const String settings = '/settings';

  static final List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashPage()),
    GetPage(name: onboarding, page: () => const OnboardingPage()),
    GetPage(name: signIn, page: () => const SignInPage()),
    GetPage(name: signUp, page: () => const SignUpPage()),
    GetPage(name: verificationCode, page: () => const VerificationCodePage()),
    GetPage(name: newPassword, page: () => const NewPasswordPage()),
    GetPage(name: confirmEmail, page: () => const ConfirmEmailPage()),
  ];
}
