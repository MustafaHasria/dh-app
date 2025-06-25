import 'package:get/get.dart';
import '../../core/network/api_client.dart';
import '../../core/storage/token_storage.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_user_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';
import '../../domain/usecases/change_password_usecase.dart';
import '../../domain/usecases/delete_user_usecase.dart';
import '../controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    // Data sources
    Get.lazyPut(() => UserRemoteDatasource(Get.find<ApiClient>()));

    // Repositories
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl(
          Get.find<UserRemoteDatasource>(),
          Get.find<TokenStorage>(),
        ));

    // Use cases
    Get.lazyPut(() => GetUserUseCase(Get.find<UserRepository>()));
    Get.lazyPut(() => UpdateUserUseCase(Get.find<UserRepository>()));
    Get.lazyPut(() => ChangePasswordUseCase(Get.find<UserRepository>()));
    Get.lazyPut(() => DeleteUserUseCase(Get.find<UserRepository>()));

    // Controllers
    Get.lazyPut(() => UserController(
          Get.find<GetUserUseCase>(),
          Get.find<UpdateUserUseCase>(),
          Get.find<ChangePasswordUseCase>(),
          Get.find<DeleteUserUseCase>(),
          Get.find<TokenStorage>(),
        ));
  }
}
