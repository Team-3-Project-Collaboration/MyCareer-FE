import 'package:mycareer_fe/src/core/domain/domain.dart';

class UserConverter extends User {
  UserConverter({
    required super.user_id,
    required super.name,
    required super.email,
    required super.password,
    required super.dob,
    required super.province,
    required super.city,
    required super.district,
    required super.gender,
    required super.role,
  });

  factory UserConverter.fromJson(Map<String, dynamic> data) => UserConverter(
    user_id: data['user_id'] ?? 0,
    name: data['name'] ?? '',
    email: data['email'] ?? '',
    password: data['password'] ?? '',
    dob: DateTime.parse(data['dob']),
    province: data['province'] ?? '',
    city: data['city'] ?? '',
    district: data['district'] ?? '',
    gender: _parseGender(data['gender']),
    role: _parseRole(data['role']),
  );

  // Helper untuk konversi string ke enum Gender
  static Gender _parseGender(String gender) {
    return Gender.values.firstWhere(
      (e) => e.name.toLowerCase() == gender.toLowerCase(),
      orElse: () => Gender.other,
    );
  }

  // Helper untuk konversi string ke enum Role
  static Role _parseRole(String role) {
    return Role.values.firstWhere(
      (e) => e.name.toLowerCase() == role.toLowerCase(),
      orElse: () => Role.user,
    );
  }
}
