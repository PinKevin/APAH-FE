import 'package:asesmen_paud/domain/usecases/get_user_profile_use_case.dart';
import 'package:asesmen_paud/domain/usecases/sign_out_use_case.dart';
import 'package:asesmen_paud/presentation/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignOutUseCase>(
      () => SignOutUseCase(authRepository: Get.find()),
    );

    Get.lazyPut<GetUserProfileUseCase>(
      () => GetUserProfileUseCase(authRepository: Get.find()),
    );
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        signOutUseCase: Get.find(),
        getUserProfileUseCase: Get.find(),
      ),
    );
  }
}
