import 'package:asesmen_paud/domain/usecases/get_user_profile_use_case.dart';
import 'package:asesmen_paud/domain/usecases/sign_out_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final SignOutUseCase signOutUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;

  DashboardController({
    required this.signOutUseCase,
    required this.getUserProfileUseCase,
  });

  var isLoading = false.obs;
  var teacherName = 'Guru'.obs;

  @override
  void onInit() {
    super.onInit();
    _getTeacherInfo();
  }

  void _getTeacherInfo() async {
    try {
      final profile = await getUserProfileUseCase.execute();
      teacherName.value = profile.name;
    } catch (e) {
      teacherName.value = 'Guru';
    }
  }

  void signOut() async {
    try {
      isLoading(true);
      await signOutUseCase.execute();
      Get.offAllNamed('/sign-in');

      Get.snackbar(
        'Berhasil',
        'Anda berhasil sign-out',
        backgroundColor: Colors.green[600],
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal sign-out: $e',
        backgroundColor: Colors.red[600],
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
