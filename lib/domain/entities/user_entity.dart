class UserEntity {
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String countryCode;

  UserEntity({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
  });

  UserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? countryCode,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
