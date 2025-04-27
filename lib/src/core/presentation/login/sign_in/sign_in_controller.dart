import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/core/application/application.dart';
import 'package:mycareer_fe/src/core/presentation/login/sign_in/sign_in_state.dart';
import 'package:mycareer_fe/src/core/presentation/splash_screen/splash_controller.dart';
import 'package:mycareer_fe/src/shared/extension/dynamic.dart';

class SignInController extends StateNotifier<SignInState> {
  final UserService _userService;
  final SplashController _splashController;

  SignInController(this._userService, this._splashController)
    : super(SignInState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    // loading
    state = state.copyWith(loginValue: const AsyncLoading());

    final result = await _userService.loginData(
      emailController.text,
      passwordController.text,
    );

    result.when(
      success: (data) async {
        // success
        _splashController.updateUserValue(AsyncData(data));
        state = state.copyWith(
          loginValue: AsyncData(data),
          userValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        // failure
        state = state.copyWith(loginValue: AsyncError(error, stackTrace));
      },
    );
  }

  void onObscureTap() {
    state = state.copyWith(isObscure: !state.isObscure);
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

final signInControllerProvider =
    StateNotifierProvider<SignInController, SignInState>((ref) {
      final userService = ref.read(userServiceProvider);
      final splashController = ref.read(splashControllerProvider.notifier);
      return SignInController(userService, splashController);
    });
