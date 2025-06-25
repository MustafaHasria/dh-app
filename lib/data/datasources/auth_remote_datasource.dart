import '../../core/network/api_client.dart';
import '../../domain/entities/user_entity.dart';
import 'dart:convert';

class AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasource(this.apiClient);

  Future<Map<String, dynamic>?> login(String email, String password) async {
    final response = await apiClient.post(
      '/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.headers['content-type']?.contains('application/json') == true) {
      final data = jsonDecode(response.body);
      if (data is Map && data['message']?.toString().contains('Imunify360') == true) {
        throw Exception('Access denied by server security. Please try again without VPN or contact support.');
      }
      return data;
    } else {
      throw Exception('Unexpected server response. Please try again later.');
    }
  }

  Future<bool> register(UserEntity user, String password, String passwordConfirm) async {
    final response = await apiClient.post(
      '/user/register',
      body: {
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'country_code': user.countryCode,
        'password': password,
        'password_confirm': passwordConfirm,
      },
    );
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.headers['content-type']?.contains('application/json') == true) {
      final data = jsonDecode(response.body);
      if (data is Map && data['message']?.toString().contains('Imunify360') == true) {
        throw Exception('Access denied by server security. Please try again without VPN or contact support.');
      }
      return true;
    } else if (response.statusCode == 400 && response.headers['content-type']?.contains('application/json') == true) {
      final data = jsonDecode(response.body);
      if (data is Map && data['message'] != null) {
        throw Exception(data['message'].toString());
      }
      throw Exception('Invalid registration data.');
    } else {
      throw Exception('Unexpected server response. Please try again later.');
    }
  }
}
