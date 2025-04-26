part of 'domain.dart';

// Enums untuk gender dan role
enum Gender { male, female, other }

enum Role { user, admin }

class User {
  final int user_id;
  final String name;
  final String email;
  final String password;
  final DateTime dob;
  final String province;
  final String city;
  final String district;
  final Gender gender;
  final Role role;

  const User({
    required this.user_id,
    required this.name,
    required this.email,
    required this.password,
    required this.dob,
    required this.province,
    required this.city,
    required this.district,
    required this.gender,
    required this.role,
  });

  User.reset({
    this.user_id = 0,
    this.name = '',
    this.email = '',
    this.password = '',
    DateTime? dob,
    this.province = '',
    this.city = '',
    this.district = '',
    this.gender = Gender.other,
    this.role = Role.user,
  }) : dob = dob ?? DateTime(0);
}
