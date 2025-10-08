import 'package:asesmen_paud/data/providers/auth_provider.dart';
import 'package:asesmen_paud/data/repositories/auth_repository_impl.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';
import 'package:asesmen_paud/domain/usecases/sign_in_use_case.dart';
import 'package:asesmen_paud/presentation/controllers/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(authProvider: Get.find()),
    );
    Get.lazyPut<SignInUseCase>(() => SignInUseCase(authRepository: Get.find()));
    Get.lazyPut<SignInController>(
      () => SignInController(signInUseCase: Get.find()),
    );
  }
}
