import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<void> execute(String email, String password) async {
    final signInEntity = await authRepository.signIn(email, password);
    await authRepository.saveToken(signInEntity.token);
  }
}
