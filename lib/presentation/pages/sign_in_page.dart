import 'package:asesmen_paud/presentation/controllers/sign_in_controller.dart';
import 'package:asesmen_paud/widget/button/submit_primary.dart';
import 'package:asesmen_paud/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign-in')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Obx(
                () => TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(),
                    errorText: controller.emailError.value,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email wajib diisi';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    errorText: controller.passwordError.value,
                    suffixIcon: IconButton(
                      onPressed: controller.togglePasswordVisibility,
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Obx(() {
                if (controller.errorMessage.isNotEmpty) {
                  return ErrorMessage(message: controller.errorMessage.value);
                } else {
                  return const SizedBox.shrink();
                }
              }),

              const SizedBox(height: 10),

              Obx(
                () => SubmitPrimaryButton(
                  text: 'Masuk',
                  onPressed: controller.signIn,
                  isLoading: controller.isLoading.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
