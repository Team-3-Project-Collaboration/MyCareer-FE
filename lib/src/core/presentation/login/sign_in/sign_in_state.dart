import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/core/domain/domain.dart';

class SignInState {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AsyncValue<User?> loginValue;
  final AsyncValue<User?> userValue;
  final bool isObscure;

  SignInState({
    this.loginValue = const AsyncData(null),
    this.userValue = const AsyncData(null),
    this.isObscure = true,
  });

  bool get isLoading => loginValue.isLoading || userValue.isLoading;

  SignInState copyWith({
    AsyncValue<User?>? loginValue,
    AsyncValue<User?>? userValue,
    bool? isObscure,
  }) {
    return SignInState(
      loginValue: loginValue ?? this.loginValue,
      userValue: userValue ?? this.userValue,
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
