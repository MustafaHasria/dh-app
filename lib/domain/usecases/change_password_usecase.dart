import '../repositories/user_repository.dart';

class ChangePasswordUseCase {
  final UserRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<bool> call(String oldPassword, String newPassword) => repository.changePassword(oldPassword, newPassword);
}
