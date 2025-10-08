import 'package:asesmen_paud/domain/entities/sign_in_entity.dart';
import 'package:asesmen_paud/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase({required this.authRepository});

  Future<SignInEntity> execute(String email, String password) async {
    final signInModel = await authRepository.signIn(email, password);
    return SignInEntity(token: signInModel.token);
  }
}
