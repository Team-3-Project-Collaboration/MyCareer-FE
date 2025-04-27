part of 'data.dart';

class UserRepository {
  final DioClient _dioClient;

  UserRepository(this._dioClient);

  Future<Result<ApiResponse>> login(String email, String password) async {
    try {
      final response = await _dioClient.post(
        Endpoint.signIn,
        data: {'email': email, 'password': password},
      );

      return Result.success(ApiResponse.fromJson(response));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }

  Future<Result<ApiResponse>> me(String? token) async {
    try {
      await _dioClient.useToken(token);
      final response = await _dioClient.get(Endpoint.me);

      return Result.success(ApiResponse.fromJson(response));
    } catch (e, stackTrace) {
      return Result.failure(NetworkExceptions.getDioException(e), stackTrace);
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dio = ref.read(dioClientProvider);
  return UserRepository(dio);
});
