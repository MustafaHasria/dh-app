import '../repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase(this.repository);

  Future<bool> call() => repository.deleteUser();
}
