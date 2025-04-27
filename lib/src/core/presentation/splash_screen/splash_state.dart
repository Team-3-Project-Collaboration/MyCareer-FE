import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/core/domain/domain.dart';

class SplashState {
  final AsyncValue<User?> userValue;
  SplashState({this.userValue = const AsyncData(null)});

  bool get isLoading => userValue.isLoading;

  SplashState copyWith({AsyncValue<User?>? userValue}) {
    return SplashState(userValue: userValue ?? this.userValue);
  }
}
