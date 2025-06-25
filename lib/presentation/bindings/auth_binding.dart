import 'package:get/get.dart';
import '../../core/network/api_client.dart';
import '../../core/storage/token_storage.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Data sources
    Get.lazyPut(() => AuthRemoteDatasource(Get.find<ApiClient>()));
    
    // Repositories
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<AuthRemoteDatasource>()));
    
    // Use cases
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => RegisterUseCase(Get.find<AuthRepository>()));
    
    // Controllers
    Get.lazyPut(() => AuthController(
      Get.find<LoginUseCase>(),
      Get.find<RegisterUseCase>(),
      Get.find<TokenStorage>(),
    ));
  }
}
