import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<bool> call(UserEntity user, String password, String passwordConfirm) {
    return repository.register(user, password, passwordConfirm);
  }
}
