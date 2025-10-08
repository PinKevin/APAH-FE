import 'package:asesmen_paud/api/exception.dart';
import 'package:asesmen_paud/domain/usecases/sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asesmen_paud/api/service/auth_service.dart';

class SignInController extends GetxController {
  final SignInUseCase signInUseCase;

  SignInController({required this.signInUseCase});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  var emailError = Rxn<String>();
  var passwordError = Rxn<String>();

  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(() {
      if (emailError.value != null) {
        emailError.value = null;
      }
    });

    passwordController.addListener(() {
      if (passwordError.value != null) {
        passwordError.value = null;
      }
    });
  }

  void signIn() async {
    isLoading(true);
    errorMessage('');

    try {
      final signInEntity = await signInUseCase.execute(
        emailController.text,
        passwordController.text,
      );
      await AuthService.saveToken(signInEntity.token);
      Get.offAllNamed('/dashboard');
    } on ValidationException catch (e) {
      e.errors.forEach((field, error) {
        if (field == 'email') {
          emailError.value = e.errors['email']!.message;
        }

        if (field == 'password') {
          passwordError.value = e.errors['password']!.message;
        }
      });
    } on ErrorException catch (e) {
      errorMessage(e.message);
    } catch (e) {
      errorMessage('Sign in failed: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
