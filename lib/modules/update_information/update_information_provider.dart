import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'update_information_model.dart';

class UpdateInformationProvider {
  static const String baseUrl = 'http://testapi.alifouad91.com/api';
  final GetStorage _storage = GetStorage();

  String? get token => _storage.read('token');

  Future<UpdateInformationModel?> getUser(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UpdateInformationModel.fromJson(data['data'] ?? data);
    }
    return null;
  }

  Future<bool> updateUser(UpdateInformationModel model) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/update'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: model.toJson(),
    );
    return response.statusCode == 200;
  }
}
