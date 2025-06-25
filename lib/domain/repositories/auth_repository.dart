import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Map<String, dynamic>?> login(String email, String password);
  Future<bool> register(UserEntity user, String password, String passwordConfirm);
}
