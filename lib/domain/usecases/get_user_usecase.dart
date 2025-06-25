import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<UserEntity?> call(int id) => repository.getUser(id);
}
