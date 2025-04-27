part of 'application.dart';

class UserService {
  final UserRepository userRepository;

  UserService({required this.userRepository});

  Future<Result<User?>> loginData(String nim, String email) async {
    final result = await userRepository.login(nim, email);
    return result.when(
      success: (data) async {
        saveToken(data.data['token']);
        // return Result.success(UserConverter.fromJson(data.data));
        final resultMe = await meData(data.data['token']);
        return resultMe.when(
          success: (dataUser) {
            return Result.success(dataUser);
          },
          failure: (error, stackTrace) {
            return Result.failure(error, stackTrace);
          },
        );
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<User?>> meData(String? token) async {
    final result = await userRepository.me(token);
    return result.when(
      success: (data) {
        return Result.success(UserConverter.fromJson(data.data));
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final userServiceProvider = Provider<UserService>((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  return UserService(userRepository: userRepository);
});
