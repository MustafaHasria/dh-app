import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> getUser(int id);
  Future<bool> updateUser(UserEntity user);
  Future<bool> changePassword(String oldPassword, String newPassword);
  Future<bool> deleteUser();
}
