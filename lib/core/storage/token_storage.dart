import 'package:get_storage/get_storage.dart';

class TokenStorage {
  final _box = GetStorage();

  void saveToken(String token) => _box.write('token', token);

  String? getToken() => _box.read('token');

  void saveUserId(int id) => _box.write('userId', id);

  int? getUserId() => _box.read('userId');

  void saveTokenExpiry(String expiry) => _box.write('token_expiry', expiry);

  String? getTokenExpiry() => _box.read('token_expiry');

  bool isTokenValid() {
    final expiry = getTokenExpiry();
    if (expiry == null) return false;
    final expiryDate = DateTime.tryParse(expiry);
    if (expiryDate == null) return false;
    return DateTime.now().isBefore(expiryDate);
  }
}
