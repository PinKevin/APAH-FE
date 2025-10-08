import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class SplashController extends GetxController {
  final AuthRepository authRepository = Get.find();

  @override
  void onReady() {
    super.onReady();
    _checkTokenStatus();
  }

  Future<void> _checkTokenStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final isValid = await authRepository.checkToken();
      if (isValid) {
        Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/sign-in');
      }
    } catch (e) {
      Get.offAllNamed('/sign-in');
    }
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
