import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../../core/storage/token_storage.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDatasource;
  final TokenStorage tokenStorage;
  UserRepositoryImpl(this.remoteDatasource, this.tokenStorage);

  @override
  Future<UserEntity?> getUser(int id) async {
    final token = tokenStorage.getToken();
    if (token == null) return null;
    final data = await remoteDatasource.getUser(id, token);
    return data != null ? UserModel.fromJson(data) : null;
  }

  @override
  Future<bool> updateUser(UserEntity user) async {
    final token = tokenStorage.getToken();
    if (token == null) return false;
    return remoteDatasource.updateUser(user, token);
  }

  @override
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final token = tokenStorage.getToken();
    if (token == null) return false;
    return remoteDatasource.changePassword(oldPassword, newPassword, token);
  }

  @override
  Future<bool> deleteUser() async {
    final token = tokenStorage.getToken();
    if (token == null) return false;
    return remoteDatasource.deleteUser(token);
  }
}
