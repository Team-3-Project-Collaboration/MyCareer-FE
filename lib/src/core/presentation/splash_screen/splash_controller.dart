import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mycareer_fe/src/core/application/application.dart';
import 'package:mycareer_fe/src/core/domain/domain.dart';
import 'package:mycareer_fe/src/core/presentation/splash_screen/splash_state.dart';

class SplashController extends StateNotifier<SplashState> {
  final UserService _userService;

  SplashController(this._userService) : super(SplashState()) {
    // jalanin me() setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      me();
    });
  }

  Future<void> me() async {
    // Set loading state
    state = state.copyWith(userValue: const AsyncLoading());

    final result = await _userService.meData(null);

    result.when(
      success: (data) {
        // Set success state
        state = state.copyWith(userValue: AsyncData(data));
      },
      failure: (error, stackTrace) {
        // Set error state
        state = state.copyWith(userValue: AsyncError(error, stackTrace));
      },
    );
  }

  void updateUserValue(AsyncValue<User?> newValue) {
    state = state.copyWith(userValue: newValue);
  }
}

final splashControllerProvider =
    StateNotifierProvider<SplashController, SplashState>((ref) {
      final userService = ref.read(userServiceProvider);
      return SplashController(userService);
    });
