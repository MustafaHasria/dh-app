import '../../core/network/api_client.dart';
import '../../domain/entities/user_entity.dart';
import 'dart:convert';

class UserRemoteDatasource {
  final ApiClient apiClient;

  UserRemoteDatasource(this.apiClient);

  Future<Map<String, dynamic>?> getUser(int id, String token) async {
    final response = await apiClient.get(
      '/user/$id',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    }
    return null;
  }

  Future<bool> updateUser(UserEntity user, String token) async {
    final response = await apiClient.post(
      '/user/update',
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'country_code': user.countryCode,
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> changePassword(String currentPassword, String newPassword, String token) async {
    final response = await apiClient.post(
      '/user/changepassword',
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'password': newPassword,
        'password_confirm': newPassword,
        'current_password': currentPassword,
      },
    );
    return response.statusCode == 200;
  }

  Future<bool> deleteUser(String token) async {
    final response = await apiClient.delete(
      '/user/delete',
      headers: {'Authorization': 'Bearer $token'},
    );
    return response.statusCode == 200;
  }
}
