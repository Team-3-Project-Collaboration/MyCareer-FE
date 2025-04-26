import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/confirm_email_page.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/new_password_page.dart';
import 'package:mycareer_fe/src/core/presentation/login/forgot_pass/verification_code_page.dart';
import 'package:mycareer_fe/src/core/presentation/login/sign_in/sign_in_page.dart';
import 'package:mycareer_fe/src/core/presentation/onboarding/onboarding_page.dart';
import 'package:mycareer_fe/src/core/presentation/splash_screen/splash_page.dart';
import 'package:mycareer_fe/src/routes/error_page.dart';

enum Routes {
  // common
  splash,
  // login
  signIn,
  // signUp
  signUp,
  // intro
  onboarding,
  // home
  home,
  // permission
  confirmEmail,
  // permission
  newPassword,
  // unique id
  verificationCode,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/splash',
    routerNeglect: true,
    redirect: (context, state) {
      // // if the user is not logged in, they need to signIn
      // final loggedIn = ref.read(hiveServiceProvider).getUser() != null;
      // final loggingIn = state.subloc == '/signIn';
      // if (!loggedIn) return loggingIn ? null : '/signIn';

      // // if the user is logged in but still on the signIn page, send them to
      // // the home page
      // if (loggingIn) return '/home';

      // // no need to redirect at all
      return null;
    },
    redirectLimit: 1,
    routes: [
      GoRoute(
        path: '/splash',
        name: Routes.splash.name,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/signIn',
        name: Routes.signIn.name,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: Routes.onboarding.name,
        builder: (context, state) => const OnboardingPage(),
      ),
      // GoRoute(
      //   path: '/home',
      //   name: Routes.home.name,
      //   builder: (context, state) => const HomePage(),
      // ),
      GoRoute(
        path: '/confirm-email',
        name: Routes.confirmEmail.name,
        builder: (context, state) => const ConfirmEmailPage(),
      ),
      GoRoute(
        path: '/verification-code',
        name: Routes.verificationCode.name,
        builder: (context, state) => VerificationCodePage(),
      ),
      GoRoute(
        path: '/new-password',
        name: Routes.newPassword.name,
        builder: (context, state) => const NewPasswordPage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
});
