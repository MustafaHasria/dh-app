import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    int? id,
    required String name,
    required String email,
    required String phone,
    required String countryCode,
  }) : super(id: id, name: name, email: email, phone: phone, countryCode: countryCode);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: int.tryParse(json['id'].toString()),
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        countryCode: json['country_code'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'country_code': countryCode,
      };
}

class LoginResponseModel {
  final int id;
  final String name;
  final String countryCode;
  final String phone;
  final String email;
  final String token;
  final String tokenExpiry;

  LoginResponseModel({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.token,
    required this.tokenExpiry,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      countryCode: json['country_code'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
      tokenExpiry: json['token_expiry'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country_code': countryCode,
        'phone': phone,
        'email': email,
        'token': token,
        'token_expiry': tokenExpiry,
      };
}
