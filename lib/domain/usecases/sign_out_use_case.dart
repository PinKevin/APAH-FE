import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase({required this.authRepository});

  Future<void> execute() async {
    await authRepository.signOut();
  }
}
