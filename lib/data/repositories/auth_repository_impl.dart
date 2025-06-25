import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<Map<String, dynamic>?> login(String email, String password) {
    return remoteDatasource.login(email, password);
  }

  @override
  Future<bool> register(UserEntity user, String password, String passwordConfirm) {
    return remoteDatasource.register(user, password, passwordConfirm);
  }
}
