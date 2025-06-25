class UpdateInformationModel {
  String name;
  String email;
  String phone;
  String countryCode;

  UpdateInformationModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
  });

  factory UpdateInformationModel.fromJson(Map<String, dynamic> json) {
    return UpdateInformationModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      countryCode: json['country_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}
