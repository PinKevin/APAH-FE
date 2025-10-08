import 'package:get/get.dart';
import 'package:asesmen_paud/data/providers/auth_provider.dart';
import 'package:asesmen_paud/data/providers/local/token_local_data_source.dart';
import 'package:asesmen_paud/data/repositories/auth_repository_impl.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TokenLocalDataSource>(TokenLocalDataSource(), permanent: true);
    Get.put<AuthProvider>(AuthProvider(), permanent: true);
    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        authProvider: Get.find(),
        tokenLocalDataSource: Get.find(),
      ),
      permanent: true,
    );
  }
}
